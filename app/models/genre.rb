class Genre < ApplicationRecord
  belongs_to :item, optional: true
  validates :genre_name, presence: true
  validates :is_active, inclusion: { in: [true, false] }
end
