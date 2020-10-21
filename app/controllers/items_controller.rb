class ItemsController < ApplicationController
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
    CategoryAncestry.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  # 以下全て、formatはjsonのみ
  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = CategoryAncestry.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = CategoryAncestry.find("#{params[:child_id]}").children
  end
  
  def create
    @item = Item.new(item_params)
    items = Item.includes(:item_images).where(purchaser_id: nil)
    @items = items.order('created_at DESC').limit(5)
    @items_by_random = items.sample(5)
    if @item.save!
      redirect_to root_path, notice: '出品しました'
    else
      render :index
    end
  end

  def show
    @item = Item.includes(:item_images).find(params[:id])
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def edit
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :category_id, :detail, :brand, :price, :item_status, :prefecture_id, :days_until_shipping, :shipping_fee, item_images_attributes: [:id, :url, :_destroy]).merge(user_id: current_user.id,category_id: params[:category_id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

end

