class AddIndexToEmployeeEmailCompanyId < ActiveRecord::Migration
  def change
  	add_index :employees, [:phone, :email, :company_id] ,unique: true
  end
end
