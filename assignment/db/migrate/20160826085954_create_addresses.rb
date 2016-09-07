class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :addr
      t.references :resource , polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
