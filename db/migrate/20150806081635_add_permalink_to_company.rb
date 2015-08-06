class AddPermalinkToCompany < ActiveRecord::Migration
  def self.up
    add_column :companies, :permalink, :string
    add_index :companies, :permalink
  end
  def self.down
    remove_column :companies, :permalink
  end
end