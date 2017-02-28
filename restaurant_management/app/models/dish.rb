class Dish < ApplicationRecord
  has_many :order_dishes
  has_many :order_tables, through: :order_dishes
  has_many :menu_dishes
  has_many :menus, through: :menu_dishes, dependent: :destroy
  has_many :bill_details
  has_many :bills, through: :bill_detail

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true, numericality: true

  scope :search_dish, ->search {where("name LIKE '%#{search}%'").order("id DESC")}

  class << self
    def search search
      search_dish search
    end
  end
end
