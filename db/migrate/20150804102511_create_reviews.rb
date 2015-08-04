class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rate
      t.text :content
      t.integer :company_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
