class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true, update_only: true

    extend ActiveHash::Associations::ActiveRecordExtensions
    # belongs_to_active_hash :category
    # belongs_to_active_hash :category_ladys
    belongs_to_active_hash :prefecture

  validates :user_id, :name, :category_id, :detail, :price, :item_status, :prefecture_id, :days_until_shipping, :shipping_fee, :item_images, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :days_until_shipping, numericality: { only_integer: true }
end
