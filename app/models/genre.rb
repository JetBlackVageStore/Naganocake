class Genre < ApplicationRecord
  belongs_to :item, optional: true
  validates :genre_name, presence: true
end
