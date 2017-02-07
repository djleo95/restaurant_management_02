class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :target_id
      t.string :target_type

      t.timestamps
    end
  end
end
