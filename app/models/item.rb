class Item < ApplicationRecord
  belongs_to :user
  has_one :item_image, dependent: :destroy
  accepts_nested_attributes_for :item_image
  has_one :purchase_history, dependent: :destroy
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :category_ladys
    belongs_to_active_hash :prefecture

  validates :user_id, presence: true
  validates :name, presence: true
  validates :category_id, presence: true
  validates :detail, presence: true
  validates :price, presence: true
  validates :item_status, presence: true
  validates :prefecture_id, presence: true
  validates :days_until_shipping, presence: true
  validates :shipping_fee, presence: true
  validates :sale_or_sold, presence: true
end
