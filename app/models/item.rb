class Item < ApplicationRecord
<<<<<<< HEAD
  
  belongs_to :genres
  has_many :into_carts
  has_many :order_items
  has_many :orders, through: :oder_items
  
  attachment :image
  
=======
  belongs_to :genre
  has_many :order_items, dependent: :destroy
  has_many :into_carts, dependent: :destroy

  attachment :image_id
  validates :name, presence: true
  validates :specifcation, presence: true
  validates :item_status, inclusion: {in: [true, false]}

  def plus_tax
    @plus_tax_price = price_without * 1.10
    @plus_tax_price.floor
  end

>>>>>>> c1493b1720828b5e4ad87dcf638f565e1548a821
end
