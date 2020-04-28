class Item < ApplicationRecord
  belongs_to :ranking
  
  validates :item, presence: true, length: { maximum: 255 }
end
