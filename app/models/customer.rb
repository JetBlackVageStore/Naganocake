class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :add_deliveries, dependent: :destroy
  has_many :orders
  has_many :into_items, dependent: :destroy
  
end
