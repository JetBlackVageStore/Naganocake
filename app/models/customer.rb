class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :add_deliveries, dependent: :destroy
  has_many :orders
  has_many :into_items, dependent: :destroy
  
  validates :surname, :firstname, :surname_kana, :firstname_kana,
            :address, :phone_number,
            presence: true
            
  # 郵便番号は数字のみ許可。ハイフンやカッコは認めない
  validates :postal_code, length:{is: 7}, numericality: { only_integer: true }
  
  # 電話番号は数字のみ許可。ハイフンやカッコは認めない
  validates :phone_number, numericality: { only_integer: true }
  
  #カナ氏名はカタカナ意外不可
  validates :surname_kana, :firstname_kana, 
    format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}

  #パスワードvaridate＋再確認
  #validates :password, confirmation: true
  #validates :password_confirmation, presence: true

  validates :is_active, inclusion: { in: [true, false] }

  has_many :orders
  has_many :into_carts, dependent: :destroy
  has_many :add_deliveries, dependent: :destroy
  has_many :into_items, dependent: :destroy


  validates :surname, :firstname, :surname_kana, :firstname_kana,
            :address, :phone_number,
            presence: true

  # 郵便番号は数字のみ許可。ハイフンやカッコは認めない
  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }

  # 電話番号は数字のみ許可。ハイフンやカッコは認めない
  validates :phone_number, numericality: { only_integer: true }

  #カナ氏名はカタカナ意外不可
   validates :surname_kana, :firstname_kana,
    format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
     
 enum user_status: { '有効': true, '退会済': false }

#def active_for_authentication?
  #super && self.user_status == '有効'
#end

  #パスワードvaridate＋再確認⇨これをつけるとmypageでupdateできなくなる⇨なぜ？
  # validates :password, confirmation: true
  # validates :password_confirmation, presence: true

  # has_many :add_deliveries, dependent: :destroy
  # has_many :orders
  # has_many :into_items, dependent: :destroy

end
