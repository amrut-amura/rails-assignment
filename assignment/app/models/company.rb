class Company < ActiveRecord::Base

	before_save :lower

	has_many :employees , dependent: :destroy
	has_one :address , as: :resource , dependent: :destroy
	accepts_nested_attributes_for :address
	validates :name,:email , presence: true
	validates :password ,presence: true , on: :create
	validates :password, length: {minimum: 3}, on: :create

	valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, format: {with: valid_email_regex}
	has_secure_password

	def lower
		self.name = name.downcase
		# puts "m in model #{params}"
	end



	# accepts_nested_attributes_for  :address
end
