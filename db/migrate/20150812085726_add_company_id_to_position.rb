class AddCompanyIdToPosition < ActiveRecord::Migration
  def change
    add_column :positions, :company_id, :integer
  end
end
