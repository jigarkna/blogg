class SessionsController < ApplicationController

def new
 end

def create 
  user = User.find_by(username: params[:session][:username])
  if user && user.password==(params[:session][:password])
   session[:user_id] = user.id
   flash[:success] = "You have logged in"
   redirect_to articles_path
  else
   flash.now[:danger] = "Wrong Credentials!"
   render 'new'
  end
 end

def destroy
  session[:user_id] = nil
  flash[:success] = "You have logged out"
  redirect_to root_path
 end

end
