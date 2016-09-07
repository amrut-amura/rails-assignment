class CompaniesController < ApplicationController
	include Session
	before_action :require_log_in
	skip_before_action :require_log_in, only: [:login,:doc,:allow_login,:new,:create]
	before_action :associate_table , only: [:show]
	
	def index
		byebug
		@companies = Company.all
	end

	def login
		if check_login
			redirect_to :root
		end
			@company = Company.new
	end
	
	def allow_login
		@company = Company.find_by(email: params[:company].fetch(:email).downcase)
		puts @company.inspect
		puts  @company.authenticate(params[:company][:password]).inspect
		if ( @company && @company.authenticate(params[:company][:password]))
			login_session(@company)
			flash[:success] = "You are successfully loged in "
			HiJob.set(wait: 2.second).perform_now(@company)
			redirect_to @company , name: "amrut"
			# render plain: session[:id]
		else
			flash[:danger] = "Failed to login"
			redirect_to :login
		end
	end

	def print_hello
		puts "this is job from controller"
	end

	def logout
		logout_session
		redirect_to root_url
	end

	def new
		@company = Company.new
	end

	def create
		@company = Company.new(allow_params)
		@address = @company.build_address(allow_address)
		# render plain: @company.inspect
		# allow_employee.each do |k,v|
		# 	@employee = @company.employees.build(v)
		# end
		if ( (@company.save) && (@address.save)  )
		# if ( (@company.save) )
			session[:id] = @company.id
			redirect_to @company 
		else
			# render 'new'
		end
	end
	
	def edit
		@company = Company.find(params[:id])
	end

	def update
		byebug
		# render plain: cookies.inspect
		@company = Company.find(params[:id])
		@company.update(allow_params)
		@company.address.update(allow_address)
		# puts update_company_params
		# @company = Company.find(params[:id])
		# render plain: @company.errors.full_messages
		redirect_to @company 
	end

	def search
		@c = Company.find(params[:company_id])
		h = allow_search
		@employee = @c.employees.find_by("#{h.first[0]} like(?)", "%#{h.first[1]}%")
		render plain: @employee.inspect
	end

	def show
		@company = @company_data
	end

	def doc
		send_data generate_pdf,filename: "myinfo.pdf",type:"application/pdf"
		render :companies
	end

	def destroy
		Company.destroy(params[:id])
		redirect_to :companies
	end

	private
	 def allow_params
	 	params.require(:company).permit(:name,:email,:password, :password_confirmation)
	 end

	 def allow_employee
	 	 params.require(:company).require(:employee).permit(:employees =>[:name,:email,:phone])
	 end
	

	 def allow_address
	 	params["company"].require(:addr).permit(:info)
	 end 
	 def allow_search
	 	# params.require("search").store(company_id: params[:company_id])
	 	params.require("search").permit(:name)
	 end

	 def associate_table
	 	puts "i called it"
	 	@company_data = Company.includes(employees: :address).find(params[:id])
	 end

	 def generate_pdf
	 	Prawn::Document.new do
	 		text "name: 'Amrut jadhav'"
	 		text "email: 'amrutjadhav2294@gmail.com'"
	 	end.render
	 end
	 def require_log_in
	 	puts  "gone herer"
	 	puts "check login #{!check_login}"
	 	if !(check_login)
	 		render 'login'
	 	end
	 end
end

