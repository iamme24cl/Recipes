class SessionsController < ApplicationController
	skip_before_action :verify_user, only: [:new, :create]

	def new
		@user = User.new
	end

	def create
		@user = User.find_by(email: params[:email])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			flash[:message] = "Welcome Back! #{@user.name}"
			redirect_to user_path(@user)
		else
			flash[:error] = "Login Failed. Invalid Credentials!"
			redirect_to login_path
		end
	end

	def destroy
		session.delete :user_id

		flash[:message] = "Successfully Logged Out!"
		redirect_to root_path
	end
end
