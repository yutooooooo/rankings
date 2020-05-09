class Ranking < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 255 }
  
  has_many :items, dependent: :destroy
  
  accepts_nested_attributes_for :items, reject_if: lambda { |attributes| attributes['item'].blank? }, allow_destroy: true
  
  after_validation do
    if self.items.size <= 1
      errors.add(:base, "Itemの数が足りません。Itemには２つ以上の入力が必要です。")
    end
  end

 
end
