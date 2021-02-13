class UsersController < ApplicationController
	before_action :find_user
	skip_before_action :verify_user, only: [:new, :create]

	def index
		@users = User.all
	end

	def show
	end

	def new
		@user = User.new
	end

	def create
		# raise params.inspect
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id 
			redirect_to recipes_path
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:message] = "Successfully updated profile!"
			redirect_to user_path(@user)
		else
			render :edit
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end

	def find_user
		@user = User.find_by(id: params[:id])
	end

end
