class RemoveEmailFromArticles < ActiveRecord::Migration[5.0]
  def change
  	remove_column :articles, :email, :string
  end
end
