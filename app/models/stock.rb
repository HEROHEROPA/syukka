class Stock < ApplicationRecord
  validates :stock_amount, numericality: { greater_than_or_equal_to: 0}

  has_many :to_stocks

end
