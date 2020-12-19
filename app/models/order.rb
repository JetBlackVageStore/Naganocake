class Order < ApplicationRecord
<<<<<<< HEAD

  belongs_to :customer

=======
  
  belongs_to :customers
	has_many :order_items, dependent: :destroy
	
	enum order_status: {"入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4}
>>>>>>> 28d64d374a8ed8a56cc52fd1450b8cc7abb64c3b
end
