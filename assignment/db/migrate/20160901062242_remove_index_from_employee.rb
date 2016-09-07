class RemoveIndexFromEmployee < ActiveRecord::Migration
  def change
  	remove_index :employees , :email
  	remove_index :employees , :phone
  end
end
