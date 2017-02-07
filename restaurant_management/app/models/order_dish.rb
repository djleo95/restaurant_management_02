class OrderDish < ApplicationRecord
  belongs_to :orderTable
  belongs_to :dish
end
