class ItemsController < ApplicationController
  def index
    @item = Item.new
  end

  def new
    @item = Item.new
    @item_image = @item.item_images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      params[:item_images]['url'].each do |a|
        @item_image = @item.item_images.create!(name: a)
      end
      redirect_to root_path, notice: '出品しました'
    else
      render :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:user_id, :name, :category_id, :detail, :brand, :price, :item_status, :prefecture_id, :days_until_shipping, :shipping_fee, :sale_or_sold, item_image_attributes: [:url])
  end
end
