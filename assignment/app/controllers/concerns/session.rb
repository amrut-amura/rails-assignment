module Session
	def check_login
		!current_company.nil?
	end
	def current_company
		@curr_company ||=Company.find_by(id:session[:id])
	end
	def login_session(user)
		session[:id] = user.id 
	end
	def logout_session
		# session[:id] = nil
		session.delete(:id)
		@curr_company = nil
		# render plain: session[:id]
	end
end
	