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
    @user.save

    redirect_to "/login"
  end

end
