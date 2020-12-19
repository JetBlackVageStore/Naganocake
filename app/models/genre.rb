class Genre < ApplicationRecord
<<<<<<< HEAD
  
  has_many :items
  
=======
  belongs_to :item, optional: true
  validates :genre_name, presence: true
>>>>>>> c1493b1720828b5e4ad87dcf638f565e1548a821
end
