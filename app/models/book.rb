class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, presence: true
  validates :quantity, presence: true
  validates :price, presence: true

end
