Planning a Timer App with Endpoints Needed for App to Work

GET /register
  should present a sign up form
  users have an email
  # eventually validate email

POST /users
  create the user in database, maybe validation

SHOW /users/:id/mydreams
  users dreams and their funding and thanking status

SHOW /dreams/new
  # format integers into dollar figures (or choose currency)


SHOW /users/:id/my_funders
  funders of user's dreams
  # eventually incorporate this data into user profile view

SHOW /users/:id/dreamers_I_funded
  dreamers funded by user
  # eventually incorporate this data into user profile view

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
  - Share thanks
  # eventually send email to funder when thanks added from Dreamer
SHOW /dreams
  show all users dreams
  - how do we know if a dream needs funding?
  - how do we only show only open dreams in the view?
PATCH /dreams/:id/edit
  - update name or cost of dream

GET /transfer
  present a form to initiate a transfer of funds
POST /transfer     
  submit transfer of funds from FG to Dreamer
SHOW /transfers
  show all dreams that were funded by a FG (fairy godmother)



QUESTIONS FOR PROJECT REVIEW
  # is dream.thanks considered a dreamer_user (has_many through) user submittable attribute --- required for project??



IDEAS FOR LATER
  *  build out to have multiple funders (possibly give dreamers the option of approving who to accept)
  *  build user profile page with CRUD capabilities
  *  be able to edit thanks
  *  CREATE / ADD DB OUTLINE OF RELATIONSHIPS USING RUBY GEM ()
