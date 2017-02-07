class CreateBillDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :bill_details do |t|
      t.integer :quantity
      t.references :bill, foreign_key: true
      t.references :dish, foreign_key: true

      t.timestamps
    end
  end
end
