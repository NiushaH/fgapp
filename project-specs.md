Specifications for the Rails Assessment:

X Using Ruby on Rails for the project
X Be sure destroy is possible for Dreams class
X Include at least one has_many relationship (x has_many y; e.g. User has_many Dreams)
X Include at least one belongs_to relationship (x belongs_to y; e.g. Dream belongs_to User)
X Include at least two has_many through relationships (x has_many y through z; e.g. Funder_User has_many Dreamers Supported through Dream Funding, Dreamer_user has_many Funders through Dreams Funded)
X Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Funder has_many Dreamers through Dreams, Dreamer has_many Funders through Dreams)
X The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. dream.thanks)
X Include reasonable validations for simple model objects (list of model objects with validations e.g. Dream Name, Dream Cost)
X Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. Dream.expensive_dreams_to_fund URL: /dreams)
X Include signup
X Include login
X Include logout
X Include third party signup/login (how e.g. Devise/OmniAuth)
X Include nested resource show or index (URL e.g. users/10/mydreams, users/10/funders, users/10/funded) 
X Include nested resource "new" form (URL e.g. user/1/dreams/new)
X Include form display of validation errors (form URL e.g. /dreams/new)

Confirm:
X The application is pretty DRY
X Limited logic in controllers
X Views use helper methods if appropriate (e.g. logged_in?, current_user)
X Views use partials if appropriate (e.g. _add_thanks.html.erb)