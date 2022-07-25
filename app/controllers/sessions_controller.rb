class SessionsController < ApplicationController
# Controllers used to be called "business logic"; they are the conductor of data in your application

    def new
      @user = User.new
    end

    def create
      # ActiveRecord has lots of finder methods with appropriate SQL
      @user = User.find_by(:email => params[:email])
      if @user && @user.authenticate(params[:password])
        login(@user)
        redirect_to "/"
      else
        redirect_to "/login", :notice => "Can't find that email or password entered incorrectly."
      end
    end

    def omniauth
      # use byebug to inspect what the auth method returns
      @user = User.from_omniauth(auth)
      if @user.valid?
        session[:user_id] = @user.id
        redirect_to @user
      else
        render :new
      end
    end

    def destroy
      reset_session
      redirect_to "/"
    end

    private

    def auth
      request.env['omniauth.auth']
    end
end
