class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.integer :total_price
      t.integer :target_id
      t.string :target_type
      t.references :staff, foreign_key: true

      t.timestamps
    end
  end
end
