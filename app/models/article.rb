class Article < ApplicationRecord
	validates :title, :text, :author, presence: true
	belongs_to :category
end
