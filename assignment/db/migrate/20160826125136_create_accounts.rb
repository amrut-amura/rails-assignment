class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :bank
      t.integer :employee_id , index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
