class ItemImage < ApplicationRecord
  mount_uploader :url, ImagesUploader
  belongs_to :item, optional: true

    MAX_IMAGES_COUNT = 5
  
    validate :limit_count_images
  
    private
      def limit_count_images
        errors.add(:base, "images count limit: #{MAX_IMAGES_COUNT}") if item.item_images.count > MAX_IMAGES_COUNT
      end
end
