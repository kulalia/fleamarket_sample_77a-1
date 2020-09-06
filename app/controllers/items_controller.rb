class ItemsController < ApplicationController
  def index
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to root_path
    else
      flash.now[:alert] = '保存できませんでした'
      render :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:user_id, :name, :category_id, :detail, :brand, :price, :item_status, :prefecture_id, :days_until_shipping, :shipping_fee, :sale_or_sold, item_image: [:id, :item_id, :url])
  end
end
