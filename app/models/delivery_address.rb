class DeliveryAddress < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :first_name, presence: true
  validates :first_name_kana, presence: true, format: { with: /^[ぁ-んァ-ン]+$/ }
  validates :family_name, presence: true
  validates :family_name_kana, presence: true, format: { with: /^[ぁ-んァ-ン]+$/ }
  validates :postal_code, presence: true, format: { with: /^\d{7}$/ }
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :building, allow_blank: true
  validates :phone_number, allow_blank: true, format: { with: /^\d{10}$|^\d{11}$/}

end
