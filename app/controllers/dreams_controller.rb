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
    @dream = Dream.new(dream_params)
    Dream.create
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
    dream_name = @dream.name
    dream_cost = @dream.cost

    if params["commit"] == "Save/Update Name and/or Cost of Dream"  
      if dream_name != params[:dream][:name]
        @dream.update(name: params[:dream][:name])
      end
      if dream_cost != params[:dream][:cost]
        @dream.update(cost: params[:dream][:cost])
      end
    elsif params["commit"] == "Add Thanks"  
      @dream.update(thanks: params[:dream][:thanks])
    elsif params["commit"] == "Fund This Dream"  
      @dream.update(:funder_user_id => @current_user.id)
    end

    redirect_to dream_path(@dream.id)
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
      redirect_to dream_path(@dream.id)
    elsif params["Cost"] == ""
      redirect_to new_dream_path, notice: "Cost of Dream is missing and required for dream entry, please try again."
    elsif params["Name"] == ""
      redirect_to new_dream_path, notice: "Name of Dream is missing and required for dream entry, please try again."
    else
      render dreams_path(@dream)
    end
  end
  
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
        params.permit(:name, :cost, :funder_user_id, :thanks)
      end
    end

# raise params.inspect
