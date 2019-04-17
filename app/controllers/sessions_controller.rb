class SessionsController < ApplicationController

	def new
	end

	def create
		if user = User.where(params[:username], params[:password])[0]
      # Save the user ID in the session so it can be used in
      # subsequent requests
      session[:current_user_id] = user.id
			cookies["authentification"] = user.id
			flash[:notice] = "You are successfully log in"
      redirect_to users_path

		else
			flash[:notice] = "Your email or password are incorrect"
	  end
	end

	def destroy
		# Remove the user id from the session
    @_current_user = session[:current_user_id] = nil
		cookies["authentification"]=nil
    redirect_to root_path
	end
end
