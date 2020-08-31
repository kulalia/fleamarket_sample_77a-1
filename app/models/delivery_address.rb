class DeliveryAddress < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ぁ-ん]+\z/ }
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :family_name_kana, presence: true, format: { with: /\A[ぁ-ん]+\z/ }
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, allow_blank: true, format: { with: /\A\d{10,11}\z/ }

end
