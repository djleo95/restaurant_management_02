class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :tables do |t|
      t.text :description
      t.integer :capacity
      t.integer :table_code

      t.timestamps
    end
  end
end
