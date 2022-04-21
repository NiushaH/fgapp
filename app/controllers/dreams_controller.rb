class DreamsController < ApplicationController
   before_action :authentication_required
   
   def new
   end
   
   def create
     @dream = Dream.new
     @dream.dream = params["Dream"]
     @dream.dreamer_id = current_user.id
     if @dream.save
       
     end
      # What information do I need to fund a dream?
      # Dream Name
      # Cost of dream
      params["Dream"]

      # dreamer_id


   end
end
