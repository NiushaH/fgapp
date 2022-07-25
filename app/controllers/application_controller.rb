class ApplicationController < ActionController::Base
  # Preferred way to code because using DSL program--> Use Ruby idioms to mixin a Ruby module into a class with OOP use include (makes methods instance methods) or extend (makes methods class methods)
  # View actions are part of controller (to have their own scope)
  add_flash_types :success, :error, :warning, :info
  include ApplicationHelper::SessionsHelper
  
  # Controller filter
  before_action :current_user

  # Action / End point to HTTP Request
  def home
  end

  private
    def authentication_required
      if !logged_in?
         redirect_to "/login"
      end
    end

  # moved all code below to SessionsHelper
  # private
    # helpers / Methods used in other actions
    # def current_user
    #   if session[:current_user_id]
    #     @current_user = User.find(session[:current_user_id])
    #   end
    # end

    # def login(user)
    #   session[:current_user_id] = @user.id
    # end

    # Example of helper_method in Rails framework metaprogramming magic to make code available to view
    # def make_me_available_to_the_view
    #   raise "from controller".inspect
    # end

    #helper_method :make_me_available_to_the_view
    # Made up rails 
end
