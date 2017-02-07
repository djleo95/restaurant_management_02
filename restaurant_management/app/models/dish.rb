class Dish < ApplicationRecord
  has_many :order_dishes
  has_many :order_tables, through: :order_dishes
  has_many :menu_dishes
  has_many :menus, through: :menu_dish
  has_many :bill_details
  has_many :bills, through: :bill_detail

  belongs_to :category
end
