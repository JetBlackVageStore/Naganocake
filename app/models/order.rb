class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_items, dependent: :destroy

	validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
	validates :charge, :payment, numericality: { only_integer: true }

	enum payjp_id: {"クレジットカード": 0,"銀行振込": 1}
	enum order_status: {"入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4}
	
	def plus_tax
    @plus_tax_price = price_without * 1.10
    @plus_tax_price.floor
	end

end

