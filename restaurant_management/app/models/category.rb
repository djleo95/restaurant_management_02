class Category < ApplicationRecord
  has_many :dishes, dependent: :destroy

  validates :name, presence: true

  scope :search_category, ->search {where("name LIKE '%#{search}%'").order("id DESC")}

  class << self
    def search search
      search_category search
    end
  end
end
