class CreateStaffs < ActiveRecord::Migration[5.0]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :email
      t.integer :salary
      t.integer :work_days
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
