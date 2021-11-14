class UsersController < ApplicationController
	
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome Potterhead #{@user.username}"
			redirect_to articles_path
		else
			render 'new'
		end
	end
	
	def show
		@user = User.find(params[:id])
		@user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
	end
	
	def index
		@users = User.all
	end
	
	private
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end
	
end
