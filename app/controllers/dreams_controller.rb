class DreamsController < ApplicationController
  # Add step of logic to redirect those not logged in
  before_action :authentication_required
   
  # Ruby's built in parser understands the end of a line of code, but if you need to start
  # another line of code on the same line, you can use a semi colon
  # e.g.   def index; "blah blah blah" 
  def index
  #   raise = Dream.all.inspect
    # @dreams = Dream.all
    @dreams = Dream.by_status(:open)
  end
   
  def new
  end

  def show
    # find the dream the funder wants based on the URL (Rails uses params object and ID key for this)
    @dream = Dream.find(params[:id])
    # render a show view
  end

  def edit
    @dream = Dream.find(params[:id])
  end

  def update
    @dream = Dream.find(params[:id])
    if @dream.funder_user_id == nil
      update_funder
    else 
      update_thanks
    end
  end
  
  def update_funder 
    # raise params.inspect to debug form
    @dream = Dream.find(params[:id])
    # Mixin module SessionHelper has current_user method instead of Application_Controller
    # Rails implicitly assumes that you're building an application that has state so sessions are enabled in Rails
    # @dream.funder_user_id = current_user
    # if using strong_params you must sanitize the data, but since not triggering strong params rules for data aren't broken
    # if @dream.update(:funder_user => current_user) 
    # Refactor code to be more understandable

    # AACCKK!!!  THIS IS CURRENTLY UPDATED THE FUNDED BY FIELD AS WELL AS ADDING THANKS, BUT NEITHER ARE PERSISTING TO DATABASE
    if @dream.funded_by(current_user) # returns true or false
      # Controller doesn't understand validity, it's the traffic cop that understands models and views -- green light go there, red light go there
      # This gives truthy or falsey value -- if it returns true, then the funder updated the column to fund the dream
      redirect_to @dream
    else
      # assume that @dream.errors can explain why falsey with its message
      render :show
    end
  end

  def update_thanks 
    if @dream.add_thanks(@dream.thanks)
      redirect_to dream_path(@dream), :notice => "Your token of thanks has been saved."
    else
      render :show
    end
  end

  def create
    @dream = Dream.new
    # Using strong params implies programmer knows exactly what data they are assigning and data has been sanitized before saving to database
    @dream.name = params["Name"]
    @dream.cost = params["Cost"]
    @dream.dreamer_user_id = current_user.id
    # Rails magic .save method
    if @dream.save
      # assume new row was added to database
      render :show
    else
      redirect_to "/dreams"
    end
  end

   # What information do I need to fund a dream?
   # Dream Name
   # Cost of dream
   # params["Dream"]

   # dreamer_user_id
   
   private
      # Strong Params is required only when
      #   You are mass assigning data from params, like the example below:
      #     e.g.  User.new({:name => "Avi", :email => "avi@flatiron.com"})
      #           @user.update({})   <-- Update more than one value at once
      # "Sanitized data" means that you only have ONLY the expected keys.
      # If User.new(params) came through, Rails will stop you.
      # Rails makes you params.require(:user).permit(:name, :email)

      #   User.new(params[:user])   WON'T WORK
      #   User.new(user_params)   SANITIZED SO USERS CAN'T HACK
      def dream_params
        params.require("dream").permit(:name, :cost, :dreamer_user_id, :funder_user_id, :thanks)
      end        
end
