Planning a Timer App with Endpoints Needed for App to Work

GET /register
  should present a sign up form
  users have an email

POST /users
  create the user in database, maybe validation

SHOW /users/:id/dreams
  #   and /DREAMERSISUPPORT SHOULD BE SCOPES

SHOW /users/:id/funds

SHOW /users/:id/my_funders
  # SHOULD THIS BE A SCOPE WITHIN THE MODEL OR A VIEW??
  # Refactor to use :funder_users from user model has_many, through: object associations

SHOW /users/:id/dreamers_I_support
  # Refactor to use :dreamer_users from user model has_many, through: object associations



GET /login
  present a login form
POST /login
  create their session and redirect
  1. Tell them who they are logged in as
  2. Build a logout
  3. Create a protected page

GET /dream
  present a form to create a dream with a $ cost
POST /dream
  take the dream and cost and save both to the DB
  Built in order of app functionality
  ERRORS TROUBLESHOOTING STEPS: LOOK AT DATA RECEIVED FROM FORM, THEN DID I SET THE DATA CORRECTLY?, DID I FORGET TO SAVE THE DATA? 
GET /dreams/:id
  - Show details of the dream funding request
  - Fund a dream
SHOW /dreams
  show all users dreams
  - how do we know if a dream needs funding?
  - how do we only show only open dreams in the view?
PATCH /dreams/:id/edit
#  FIX SO THAT THANKS SAVES AND THAT CONDITIONAL ON DREAM SHOW PAGE DISPLAYS CORRECTLY

GET /transfer
  present a form to initiate a transfer of funds
POST /transfer     
  submit transfer of funds from FG to Dreamer
SHOW /transfers
  show all dreams that were funded by a FG (fairy godmother)



3 THINGS LEFT TO COMPLETE PROJECT
  # ADD A class level Active Record scope method (model object & class method name and URL to see the working feature e.g. Dreams.biggest_funded URL: /dreams/top_five_funded)
    
  # ADD / Include nested resource "new" form to add a new dream (URL e.g. dreams/1/dreams/new) 
    
  # ADD / Include third party signup/login (how e.g. Devise/OmniAuth)

  # CREATE / ADD DB OUTLINE OF RELATIONSHIPS USING RUBY GEM ()

  # UPDATE Github checklist for project specs at https://gist.github.com/NiushaH/5f4f2b73657796b9f2a63dccc7b8d8e0



QUESTIONS FOR PROJECT REVIEW
  # is dream.thanks considered a dreamer_user (has_many through) user submittable attribute --- required for project??



IDEAS FOR LATER
  *  build out to have multiple funders (possibly give dreamers the option of approving who to accept)

