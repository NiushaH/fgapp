class Dream < ApplicationRecord
    # Aliased associations that are also self-referential associations
    belongs_to :dreamer_user, :class_name => "User"
    # Turned off belongs_to validation with optional code on line below
    belongs_to :funder_user, :class_name => "User", :optional => true
end
