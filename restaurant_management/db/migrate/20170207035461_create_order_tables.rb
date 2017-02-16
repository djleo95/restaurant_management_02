class CreateOrderTables < ActiveRecord::Migration[5.0]
  def change
    create_table :order_tables do |t|
      t.datetime :book_from
      t.datetime :book_to
      t.references :table, foreign_key: true
      t.integer :target_id
      t.string :target_type

      t.timestamps
    end
  end
end
