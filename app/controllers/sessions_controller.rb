class SessionsController < ApplicationController
	skip_before_action :verify_user, only: [:new, :create, :omniauth]

	def new
		@user = User.new
	end

	def create
		@user = User.find_by(email: params[:email])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			flash[:message] = "Welcome Back! #{@user.name}"
			redirect_to recipes_path
		else
			flash[:error] = "Login Failed. Try Again!"
			redirect_to login_path
		end
	end

	def omniauth
		if auth
			@user = User.by_omniauth(auth)
			session[:user_id] = @user.id
			redirect_to recipes_path
		else
			flash[:error] = "Login Failed. Try Again."
			render :new
		end		
	end

	def destroy
		session.delete :user_id

		flash[:message] = "Successfully Logged Out!"
		redirect_to root_path
	end

	private

	def auth
		request.env['omniauth.auth']
	end
end
