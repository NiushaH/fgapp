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

GET /timer/new
  present a form to create a countdown timer with an alert message
POST /timer
  take the countdown time and message and save both to the DB
