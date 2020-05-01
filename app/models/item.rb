class Item < ApplicationRecord
  belongs_to :ranking, optional: true
  
  has_many :votes
  
  has_many :vote_users, through: :votes, source: :user 
  
end
