class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
