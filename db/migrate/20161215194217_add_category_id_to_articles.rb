class AddCategoryIdToArticles < ActiveRecord::Migration[5.0]
  def change
  	change_table :articles do |t|
  		t.integer :category_id
  	end
  end
end
