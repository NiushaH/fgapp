class Dream < ApplicationRecord
    # Aliased associations that are also self-referential associations
    belongs_to :dreamer_user, :class_name => "User"
    # Turned off belongs_to validation with optional code on line below
    belongs_to :funder_user, :class_name => "User", :optional => true
    validates :name, :length => {in: 3..100}
    validates :cost, :presence => true

  def self.by_status(status)
    # ActiveRecord Scopes help build macros like this one below:
    case status
    when :open
        where(:funder_user => nil)
    when :funded
        where.not(:funder_user => nil)
    end
  end

  # Models should have behavior; this method represents a moment in time  
  def funded_by(user)
    self.update(:funder_user => user)
  end

  def funded?
    # Force method to respond with a boolean with true or nil
    true if funder_user
  end
end
