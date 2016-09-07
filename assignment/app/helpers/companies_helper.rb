module CompaniesHelper
	def check_login
		!current_company.nil?
	end
	def current_company
		@current_company ||=Company.find(session[:id])
	end
	def login(user)
		session[:id] = user.id 
	end
	def logout
		# session[:id] = nil
		# redirect_to :root
	end

	def html_put
		"this is from helper"
	end
end
