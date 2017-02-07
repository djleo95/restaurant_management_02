class OrderTable < ApplicationRecord
  has_many :order_dishes
  has_many :dishes, through: :order_dishes

  belongs_to :table
  belongs_to :target, polymorphic: true
end
