class Item < ApplicationRecord
  belongs_to :ranking, optional: true
  
  has_many :votes, dependent: :destroy
  
  has_many :item_users, through: :votes, source: :user 
  
  validates :item, allow_blank: :true, length: {minimum: 1, maximum: 50 }
end
