class UsersController < ApplicationController
	
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome Potterhead #{@user.username}"
			redirect_to '/users'
		else
			render 'new'
		end
	end
	
	
	def index
		@users = User.paginate(page: params[:page], per_page: 3)
	end
	
	private
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end
	
end
