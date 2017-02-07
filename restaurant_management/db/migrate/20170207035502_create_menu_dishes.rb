class CreateMenuDishes < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_dishes do |t|
      t.references :menu, foreign_key: true
      t.references :dish, foreign_key: true

      t.timestamps
    end
  end
end
