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

  def show
    @user = current_user
  end

  def show_dreamer
    @user = current_user
  end

  def show_funder
    @user = current_user
  end

  def show_all_user_dreams
    @user = current_user
    dreams = @user.dream_requests.includes(:dreamer_user_id == current_user.id)
  end

  def show_investments
    @user = current_user
    investments = @user.dreams_funded.includes(:funder_user_id == current_user.id)
  end

  def show_funders
    @user = current_user
    @my_funded_dreams = @user.dream_requests.where(funder_user_id: true)
  end

  def show_dreamers_I_funded
    @user = current_user
    @dreamers_I_support = @user.dreams_funded.where(funder_user_id: current_user.id)
  end

end
