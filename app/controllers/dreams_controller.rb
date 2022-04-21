class DreamsController < ApplicationController
   # Add step of logic to redirect those not logged in
   before_action :authentication_required
   
   def new
   end
   
   def index
   #   raise = Dream.all.inspect
     @dreams = Dream.all
   end

   def create
     @dream = Dream.new
     # Using strong params implies programmer knows exactly what data they are assigning and data has been sanitized before saving to database
     @dream.name = params["Name"]
     @dream.cost = params["Cost"]
     @dream.dreamer_user_id = current_user.id

     if @dream.save
        redirect_to "/dreams"
     else
        raise @dream.errors.inspect
     end
   end

   # What information do I need to fund a dream?
   # Dream Name
   # Cost of dream
   # params["Dream"]

   # dreamer_user_id
   
   private
      # Strong Params is required only when
      #   You are mass assigning data.
      #   User.new(params[:user])   WON'T WORK
      #   User.new(user_params)   SANITIZED SO USERS CAN'T HACK
      def dream_params
      end
end
