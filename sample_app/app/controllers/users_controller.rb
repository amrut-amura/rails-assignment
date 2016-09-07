class UsersController < ApplicationController
	def show		
		@user = User.find(params[:id])
	end
	def print
		render plain: params.inspect
	end
	def new
		@user = User.new
	end
	def create
		@user = User.new(permit_user)
		# puts params[:user]
		# puts @user.inspect
		if @user.save
			flash[:success] = "Welcome to the Sample App!"
			redirect_to @user_url
		else
			render :new
		end
	end

	private

	def permit_user
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
