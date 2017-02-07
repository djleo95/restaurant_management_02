class Review < ApplicationRecord
  belongs_to :target, polymorphic: true
end
