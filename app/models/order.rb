class Order < ApplicationRecord
<<<<<<< HEAD

  
  belongs_to :customers
	has_many :order_items, dependent: :destroy
	
	validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
	validates :charge, :payment, numericality: { only_integer: true }
	
	enum payjp_id: {"クレジットカード": 0,"銀行振込": 1}
	enum order_status: {"入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4}

=======
  belongs_to :customers
>>>>>>> c1493b1720828b5e4ad87dcf638f565e1548a821
end
