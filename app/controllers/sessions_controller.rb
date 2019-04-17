class SessionsController < ApplicationController
	cookie[:users_id] = :users_id
	def new
	end

	def create
		if user = User.authenticate(params[:username], params[:password])
      # Save the user ID in the session so it can be used in
      # subsequent requests
      session[:current_user_id] = user.id
			flash[:notice] = "You are successfully log in"
      redirect_to root_path
    end
	else
		flash[:notice] = "Your email or password are incorrect"
	end

	def destroy
		# Remove the user id from the session
    @_current_user = session[:current_user_id] = nil
    redirect_to root_path
	end
end
