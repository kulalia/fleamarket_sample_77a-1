class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :delivery_addresses, dependent: :destroy
  has_one :user_profile, dependent: :destroy
  accepts_nested_attributes_for :user_profile
end
