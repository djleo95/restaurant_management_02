class Table < ApplicationRecord
  has_many :order_tables

  scope :free, -> (capacity, from, to) {
    list_booked = OrderTable.book_in_about(from ,to).map(&:table_id)
    if list_booked.count == 0
    	list_booked = [0]
    end
    where("capacity = (?) AND id not in (?)",capacity ,list_booked)
  }
end
