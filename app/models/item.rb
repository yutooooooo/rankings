class Item < ApplicationRecord
  belongs_to :ranking, optional: true
  
  has_many :votes
  
  has_many :total_votes, through: :votes, source: :user 
end
