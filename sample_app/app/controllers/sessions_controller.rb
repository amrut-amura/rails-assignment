class SessionsController < ApplicationController
  def new

  end
  def create
  	u = User.find_by(email: params[:session][:email].downcase)
  	if u && u.authenticate(params[:session][:password])
  		log_in u
       params[:session][:remember_me] == '1' ? remember(u) : forget(u)
  		flash[:success] = "Welcome #{u.name}"
  		redirect_to u
  	else
  		flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
		render 'new'
  	end
  end

	def show
  		@user = User.find(params[:id])
  	end
  	
  def destroy
		log_out if logged_in?
		redirect_to root_url
	end


    

end
