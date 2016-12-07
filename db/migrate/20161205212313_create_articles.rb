class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.text :author
      t.boolean :visible

      t.timestamps
    end
  end
end
