class RegistrationsController < ApplicationController
	def new

	end

	def create
	   usuario = User.new(name: params[:registrations][:name], last_name: params[:registrations][:last_name], email: params[:registrations][:email], phone: params[:registrations][:phone], password: params[:registrations][:password])
			 if usuario.save
				 flash[:notice] = "Your registration is complete"
				 redirect_to root_path
			else
				flash[:notice] = "Your registration has fail, try again"
				redirect_to registration_path
			end
	end
end
