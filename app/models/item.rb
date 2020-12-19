class Item < ApplicationRecord
  
  belongs_to :genres
  has_many :into_carts
  has_many :order_items
  has_many :orders, through: :oder_items
  
  attachment :image
  
end
