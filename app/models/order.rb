class Order < ApplicationRecord
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD

  belongs_to :customer

=======
=======

>>>>>>> 10ee55873ca8aecb4d8cb5c9b255283aa946a3be
  
  belongs_to :customers
	has_many :order_items, dependent: :destroy
	
	validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
	validates :charge, :payment, numericality: { only_integer: true }
	
	enum payjp_id: {"クレジットカード": 0,"銀行振込": 1}
	enum order_status: {"入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4}
<<<<<<< HEAD
>>>>>>> 28d64d374a8ed8a56cc52fd1450b8cc7abb64c3b
=======

>>>>>>> 10ee55873ca8aecb4d8cb5c9b255283aa946a3be
=======
  belongs_to :customers
>>>>>>> c1493b1720828b5e4ad87dcf638f565e1548a821
end
