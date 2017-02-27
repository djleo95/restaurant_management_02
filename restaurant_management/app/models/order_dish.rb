class OrderDish < ApplicationRecord
  belongs_to :order_table
  belongs_to :dish

  validates :quantity, presence: true, numericality: {greater_than_or_equal_to: 1}
end
