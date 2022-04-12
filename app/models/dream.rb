class Dream < ApplicationRecord
    # Aliased associations that are also self-referential associations
    belongs_to :dreamer_user, :class_name => "User"
    belongs_to :funder_user, :class_name => "User"
end


d = Dream.new
d.dreamer_user_id = 1
d.funder_user_id = 2
d.save
