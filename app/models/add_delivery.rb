class AddDelivery < ApplicationRecord
  belongs_to :customer

  validates :address, presence: true
  validates :postal_code, presence: true
  validates :addressee, presence: true
end
