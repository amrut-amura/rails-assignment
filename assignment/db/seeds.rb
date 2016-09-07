# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# 2.times do |x|
# 	company = Faker::Company
# 	addr = Faker::Address
# 	c = Company.create(name: company.name)
# 	c.create_address(info:addr.street_name)
# 	2.times do |y|
# 		name = Faker::Name.name
# 		email = Faker::Internet.email
# 		phone ="+91"+rand(7111111111..9999999999).to_s
# 		p phone
# 		designation = Faker::Company.profession
# 		salary = rand(10000..200000)
# 		e = c.employees.create(name: name , email: email , phone: phone , designation: designation , salary: salary)
# 		p e.inspect
# 		e.create_address(info: addr.street_name)
# 	end 

# end 