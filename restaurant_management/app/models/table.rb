class Table < ApplicationRecord
  has_many :order_tables

  scope :free, -> (capacity, from, to) {
    where(capacity: capacity)
    .where( "id not in (?)",
      (OrderTable.book_in_about(from ,to).map(&:table_id)))
  }
end
