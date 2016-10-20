class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  def app
  	# render :app
  	render plain: "hello"
  end
end
