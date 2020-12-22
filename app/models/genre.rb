class Genre < ApplicationRecord
  has_many :items
  validates :genre_name, presence: true
<<<<<<< HEAD
=======
  # validates :is_active, inclusion: { in: [true, false] }

>>>>>>> 8876049db369ffaa1fda415394f53c2275b4ef36
end
