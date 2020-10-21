class CategoryAncestry < ApplicationRecord
  has_ancestry
  has_many :items

  validates :name, presence: true
end
