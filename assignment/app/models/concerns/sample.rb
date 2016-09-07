module Sample
	extend ActiveSupport::Concern
	# extend ActiveModel::Concern
	def hello
		puts "hello object"
	end
	class_methods do
		def auth
			puts "you are authenticate"
		end
	end
end