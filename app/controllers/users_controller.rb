class UsersController < ApplicationController

  def new
    # teach application how to remember people
    if session[:current_user_id]
      redirect_to "/", :notice => "Already logged in!"
    end
  end

  def create
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]
    if @user.save
      redirect_to "/login"
    else
      render :new
    end
  end
end
