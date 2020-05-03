class Item < ApplicationRecord
  belongs_to :ranking, optional: true
  
  has_many :votes
  
  has_many :item_users, through: :votes, source: :user 
  
end
