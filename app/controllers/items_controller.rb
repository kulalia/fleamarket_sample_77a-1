class ItemsController < ApplicationController
  def index
    items = Item.includes(:item_images).where(purchaser_id: nil)
    @items = items.order('created_at DESC').limit(5)

  end

  def new
    @item = Item.new
    @item.item_images.build
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to root_path, notice: '出品しました'
    else
      render :index
    end
  end

  def show
    @item = Item.includes(:item_images).find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :category_id, :detail, :brand, :price, :item_status, :prefecture_id, :days_until_shipping, :shipping_fee, item_images_attributes: [:id, :url, :_destroy]).merge(user_id: current_user.id)
  end
end