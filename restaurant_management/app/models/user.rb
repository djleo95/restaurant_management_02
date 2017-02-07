class User < ApplicationRecord
  has_many :order_tables, as: :target
  has_many :reviews, as: :target
  has_many :bills, as: :target
end
