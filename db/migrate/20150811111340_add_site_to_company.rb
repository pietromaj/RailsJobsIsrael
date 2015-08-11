class AddSiteToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :site, :string
  end
end
