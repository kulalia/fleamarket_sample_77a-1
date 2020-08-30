class UserProfile < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true
  validates :first_name_kana, presence: true, format: { with: /^[ぁ-んァ-ン]+$/ }
  validates :family_name, presence: true
  validates :family_name_kana, presence: true, format: { with: /^[ぁ-んァ-ン]+$/ }
  validates :birthday, presence: true

end
