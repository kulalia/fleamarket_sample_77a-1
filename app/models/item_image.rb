class ItemImage < ApplicationRecord
  mount_uploader :url, ImagesUploader
  belongs_to :item, optional: true
  # validates :url, presence: true
end
