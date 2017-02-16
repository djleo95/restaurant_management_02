class OrderTable < ApplicationRecord
  has_many :order_dishes
  has_many :dishes, through: :order_dishes

  belongs_to :table
  belongs_to :target, polymorphic: true

  scope :book_in_about, -> from, to {
    where "(book_from BETWEEN ? AND ?) or (book_to BETWEEN ? AND ?)" ,from ,to, from ,to
  }
end
