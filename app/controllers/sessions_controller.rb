class SessionsController < ApplicationController
  def create
  	user = User.authenticate(params[:session][:email], params[:session][:password])
    if user.nil?
    else
      sign_in user
    end
    @current_page = "ADMIN"
  	render :action => 'admin'

  end

  def admin
		@current_page = "ADMIN"
	end

  def destroy
    sign_out
    redirect_to root_path
  end
end
