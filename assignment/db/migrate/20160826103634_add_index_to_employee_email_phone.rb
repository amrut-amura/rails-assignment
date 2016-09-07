class AddIndexToEmployeeEmailPhone < ActiveRecord::Migration
  def change
  	add_index :employees, :email, unique: true
  	add_index :employees, :phone, unique: true
  end
end
