class RemovePasswordFromCompanies < ActiveRecord::Migration
  def change
    remove_column :companies, :password, :string
  end
end
