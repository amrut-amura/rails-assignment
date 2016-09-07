class Address < ActiveRecord::Base
	belongs_to :resource , polymorphic: true
	validates :info, presence: true
end



# Employee.joins(:Address).where(name:"Mr. Flo Schmidt").pluck(:name,:info)
# Address.where(info:"Watsica Spurs",resource_type:"Employee").collect{|x| x.resource}
# Employee.eager_load(:address).where("addresses.info='Watsica Spurs'").pluck(:name,:info)
# Employee.where(salary:10000..50000)
