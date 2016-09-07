class RenameAddrtoInfo < ActiveRecord::Migration
  def change
  	rename_column :addresses , :addr ,:info 
  end
end
