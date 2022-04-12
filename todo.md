Planning a Timer App with Endpoints Needed for App to Work

GET /register
  should present a sign up form
  users have an email

POST /users
  create the user in database, maybe validation

GET /login
  present a login form
POST /login
  create their session and redirect
  1. Tell them who they are logged in as
  2. You forgot to build a logout
  3. Create a protected page

GET /food/new
  present a form to create a new food with countdown timer(s)
POST /food
  take the food item data with timer intervals and save them to the DB

GET /countdown
  show a list of all countdowns in progress

GET /countdown/:id
  Show details of countdown (food steps)
  BUTTON to check off completion of time interval (start next one, or end all in progress because food is done being made)

PATCH /food/:id
  Update the countdown timer interval

PUT /food

DELETE /food

PATCH /countdown/:id

DELETE /countdown/:id

