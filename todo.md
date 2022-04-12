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

GET /dream
  present a form to create a dream with a $ cost
POST /dream
  take the dream and cost and save both to the DB
SHOW /dreams
  show all users dreams

GET /transfer
  present a form to initiate a transfer of funds
POST /transfer     
  submit transfer of funds from FG to Dreamer
SHOW /transfers
  show all dreams that were funded by a FG (fairy godmother)

