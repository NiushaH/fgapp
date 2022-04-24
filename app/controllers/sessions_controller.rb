class SessionsController < ApplicationController
# Controllers used to be called "business logic"; they are the conductor of data in your application

    def new
    end

    def create
      # ActiveRecord has lots of finder methods with appropriate SQL
      @user = User.find_by(:email => params[:email])
      if @user && @user.authenticate(params[:password])
        login(@user)
        redirect_to "/"
      else
        redirect_to "/login", :notice => "Can't find that user"
      end
    end

    def destroy
      reset_session
      redirect_to "/"
    end
end
