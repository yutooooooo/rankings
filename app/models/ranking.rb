class Ranking < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 255 }
  
  has_many :items
  
  accepts_nested_attributes_for :items
end
