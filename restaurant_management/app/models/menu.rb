class Menu < ApplicationRecord
  has_many :menu_dishes
  has_many :dishes, through: :menu_dishes, dependent: :destroy

  scope :search_menu, ->search {where("name LIKE '%#{search}%'").order("id DESC")}

  class << self
    def search search
      search_menu search
    end
  end
end
