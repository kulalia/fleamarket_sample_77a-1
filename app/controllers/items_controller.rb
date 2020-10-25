class ItemsController < ApplicationController
  before_action :move_to_signin, except: [:index]
  before_action :set_item, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren]

  def index
    # 購入者がいない商品を取得
    items = Item.includes(:item_images).where(purchaser_id: nil)

    # 新しい投稿から5件取得
    @items = items.order('created_at DESC').limit(5)

    # ランダムに5件取得
    @items_by_random = items.sample(5)
  end

  def new

    @item = Item.new
    @item.item_images.build

    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end
  
  def create

    @item = Item.new(item_params)
    items = Item.includes(:item_images).where(purchaser_id: nil)
    @items = items.order('created_at DESC').limit(5)
    @items_by_random = items.sample(5)
    if @item.save
      redirect_to root_path, notice: '出品しました'
    else
      @item.item_images.build
      #セレクトボックスの初期値設定
      @category_parent_array = ["---"]
      #データベースから、親カテゴリーのみ抽出し、配列化
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end
      render :new
    end
  end

  def show
    @item = Item.includes(:item_images).find(params[:id])
  end

    
  def edit

    category_grandchild = @item.category
    category_child = category_grandchild.parent

    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children_array = []
    Category.where(ancestry: category_child.ancestry).each do |children|
      @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: category_grandchild.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end

  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else

      category_grandchild = @item.category
      category_child = category_grandchild.parent


      @category_parent_array = []
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end

      @category_children_array = []
      Category.where(ancestry: category_child.ancestry).each do |children|
        @category_children_array << children
      end

      @category_grandchildren_array = []
      Category.where(ancestry: category_grandchild.ancestry).each do |grandchildren|
        @category_grandchildren_array << grandchildren
      end

      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end
  

  # 以下全て、formatはjsonのみ
  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end


  private
  def item_params
    params.require(:item).permit(:name, :category_id, :detail, :brand, :price, :item_status, :prefecture_id, :days_until_shipping, :shipping_fee, item_images_attributes: [:id, :url, :_destroy]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_signin
    redirect_to new_user_session_path unless user_signed_in?
  end


end





# 「孫カテゴリがあるかどうか？」といった条件分岐でどこまでフォームを表示させるかを変える
# ・editのビューに必要なインスタンス変数をupdateアクションの中に書く