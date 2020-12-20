class Item < ApplicationRecord

  belongs_to :genre, optional: true
  has_many :order_items, dependent: :destroy
  has_many :into_carts, dependent: :destroy
  has_many :orders, through: :oder_items

  attachment :image
  validates :name, presence: true
  validates :specifcation, presence: true
  validates :item_status, inclusion: {in: [true, false]}

  def plus_tax
    @plus_tax_price = price_without * 1.10
    @plus_tax_price.floor
  end

end
