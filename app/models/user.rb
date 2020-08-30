class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :delivery_addresses, dependent: :destroy
  accepts_nested_attributes_for :delivery_addresses
  has_one :user_profile, dependent: :destroy
  accepts_nested_attributes_for :user_profile

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A\S+@\S+\.\S+\z/ }
  validates :encrypted_password, presence: true, length: { minimum: 7 }

end
