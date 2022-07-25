Specifications for the Rails Assessment
Specs:

X Using Ruby on Rails for the project
 Include at least one has_many relationship (x has_many y; e.g. User has_many Dreams)
 Include at least one belongs_to relationship (x belongs_to y; e.g. Dream belongs_to User)
 Include at least two has_many through relationships (x has_many y through z; e.g. Funder_User has_many Dreamers Supported through Dream Funding, Dreamer_user has_many Funders through Dreams Funded)
 Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Funder has_many Dreamers through Dreams, Dreamer has_many Funders through Dreams)
 The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. dream.thanks)
 Include reasonable validations for simple model objects (list of model objects with validations e.g. Dream Name, Dream Cost)
# Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
 Include signup
 Include login
 Include logout
# Include third party signup/login (how e.g. Devise/OmniAuth)
 Include nested resource show or index (URL e.g. users/10/mydreams, users/10/funders, users/10/funded) 
# Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
 Include form display of validation errors (form URL e.g. /dreams/new)

Confirm:
 The application is pretty DRY
 Limited logic in controllers
 # Views use helper methods if appropriate
 Views use partials if appropriate