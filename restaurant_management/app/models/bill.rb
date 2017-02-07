class Bill < ApplicationRecord
  has_many :bill_details
  has_many :dishes, through: :bill_details

  belongs_to :staff
  belongs_to :target, polymorphic: true
end
