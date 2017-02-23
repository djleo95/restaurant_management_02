class Review < ApplicationRecord
  belongs_to :target, polymorphic: true, optional: true

  validates :content, presence: true, length: {maximum: 1000}

  scope :order_desc, -> {order created_at: :desc}
end
