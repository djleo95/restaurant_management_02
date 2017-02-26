class Bill < ApplicationRecord
  has_many :bill_details
  has_many :dishes, through: :bill_details

  belongs_to :staff
  belongs_to :target, polymorphic: true
  accepts_nested_attributes_for :bill_details, :allow_destroy => true
end
