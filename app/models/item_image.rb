class ItemImage < ApplicationRecord
  belongs_to :item
  mount_uploader :url, ImagesUploader

  def self.create_item_image(item_params)

    return false if item_params[:url].nil?

    Item.transaction do
      
      item_params[:url].each do |image|
        new_image = ItemImage.new(title: item_params[:name], content: image)
        return false unless new_image.save!
      end
    end

    true
  end
end
