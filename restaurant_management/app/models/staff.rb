class Staff < ApplicationRecord
  has_many :bills
  
  belongs_to :role
end
