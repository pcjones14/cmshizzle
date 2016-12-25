class AddAvatarToArticles < ActiveRecord::Migration[5.0]
  def self.up
    add_attachment :articles, :image
  end

  def self.down
    remove_attachment :articles, :image
  end

end
