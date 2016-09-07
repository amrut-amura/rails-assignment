class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	validates :title, presence: {message: "Title field should bbe given"}, length: { minimum: 5 } 
	puts ActiveModel::Validations::Callbacks.class	
end
