class Dream < ApplicationRecord
    # Aliased associations that are also self-referential associations
    belongs_to :dreamer_user, :class_name => "User"
    # Turned off belongs_to validation with optional code on line below
    belongs_to :funder_user, :class_name => "User", :optional => true

  # Models should have behavior; this method represents a moment in time  
  def funded_by(user)
    self.update(:funder_user => user)
  end

  def funded?
    # Force method to respond with a boolean with true or nil
    true if funder_user
  end
end
