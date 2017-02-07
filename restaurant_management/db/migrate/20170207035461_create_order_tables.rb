class CreateOrderTables < ActiveRecord::Migration[5.0]
  def change
    create_table :order_tables do |t|
      t.date :from
      t.date :to
      t.references :table, foreign_key: true
      t.integer :target_id
      t.string :target_type

      t.timestamps
    end
  end
end
