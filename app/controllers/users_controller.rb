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
      render :new, :error => "Please include a password."
    end
  end

  # TODO -- CREATE METHOD TO SHOW ONLY CURRENT USERS DREAMS SO THEY CAN SEE FUNDING STATUS
  def show
    @dreams = current_user.dream_requests
  end
end
