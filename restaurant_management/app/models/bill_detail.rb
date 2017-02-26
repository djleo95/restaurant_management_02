class BillDetail < ApplicationRecord
  belongs_to :bill, optional: true
  belongs_to :dish
end
