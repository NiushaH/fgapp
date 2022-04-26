Planning a Timer App with Endpoints Needed for App to Work

GET /register
  should present a sign up form
  users have an email

POST /users
  create the user in database, maybe validation

SHOW /users/:id/dreams
  # make url :id dynamic

SHOW /users/:id/funds
  # make url :id dynamic

SHOW /users/:id/my_funders
  # Refactor to use :funder_users from user model has_many, through: object associations

SHOW /users/:id/dreamers_I_support
  # Refactor to use :dreamer_users from user model has_many, through: object associations


# CREATE DB OUTLINE OF RELATIONSHIPS USING RUBY GEM ()

GET /login
  present a login form
POST /login
  create their session and redirect
  1. Tell them who they are logged in as
  2. You forgot to build a logout
  3. Create a protected page

GET /dream
  present a form to create a dream with a $ cost
POST /dream
  take the dream and cost and save both to the DB
# Build in order of app functionality
# ERRORS TROUBLESHOOTING STEPS: LOOK AT DATA RECEIVED FROM FORM, THEN DID I SET THE DATA CORRECTLY?, DID I FORGET TO SAVE THE DATA? 
GET /dreams/:id
  - Show details of the dream funding request
  ACCEPT TO FUND DREAM
SHOW /dreams
  show all users dreams
  - how do we know if a dream needs funding?
  - how do we only show only open dreams in the view?


GET /transfer
  present a form to initiate a transfer of funds
POST /transfer     
  submit transfer of funds from FG to Dreamer
SHOW /transfers
  show all dreams that were funded by a FG (fairy godmother)



IDEAS FOR LATER
  *  build out to have multiple funders (possibly give dreamers the option of approving who to accept)

