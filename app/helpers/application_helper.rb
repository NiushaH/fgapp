module ApplicationHelper
    # A space for view-level helpers not controller helpers
    # line below is a subscope
  module SessionsHelper

    def logged_in?
      # current_user ? true : false
      !!current_user 
    end

    def current_user
        if session[:current_user_id]
          # On first call to db if user is found, memorization (i.e. cheap caching) 
          # occurs and second time it's called in request cycle app runs more quickly.
          # If @current_user doesn't exist, it will populate it.
          @current_user ||= User.find(session[:current_user_id])
        end
    end
  
    def login(user)
        session[:current_user_id] = @user.id
    end
  end  
end
