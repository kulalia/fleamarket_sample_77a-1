class Item < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_one :purchase_history, dependent: :destroy
end
