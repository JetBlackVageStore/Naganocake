class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :into_carts, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :add_deliveries, dependent: :destroy

  validates :is_active, inclusion: { in: [true, false] }

end
