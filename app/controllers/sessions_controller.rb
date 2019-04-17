class SessionsController < ApplicationController
	cookie[:users_id] = :users_id
	def new
	end

	def create
		if user = User.authenticate(params[:username], params[:password])
      # Save the user ID in the session so it can be used in
      # subsequent requests
      session[:current_user_id] = user.id
			flash[:notice] = ""
      redirect_to root_path
    end
	else
		flash[:notice] = ""
	end

	def destroy
		#complete this method
	end
end
