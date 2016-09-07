class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def app
  	# render :app
  	render plain: "hello"
  end
end
