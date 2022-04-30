class Dream < ApplicationRecord
    # Aliased associations that are also self-referential associations, 
    # SHOULD I ADD THIS: , :foreign_key => "dream_requests_id"
    belongs_to :dreamer_user, :class_name => "User"
    # Turned off belongs_to validation with optional code on line below
    # SHOULD I ADD THIS: , :foreign_key => "dreams_funded_id"
    belongs_to :funder_user, :class_name => "User", :optional => true
    validates :name, :length => {in: 3..100}
    validates :cost, :presence => true
    # check the object in Rails console by calling self.changes
    validate :different_funder
    # scope :my_dream, -> { where('dreamer_user_id = @current_user.id', dreamer_user) }

  def self.by_status(status)
    # ActiveRecord Scopes help build macros like this one below:
    case status
    when :open
        where(:funder_user => nil)
    when :funded
        where.not(:funder_user => nil)
    end
  end

  def different_funder
    if self.funder_user == self.dreamer_user
      self.errors.add(:funder_user)
    end
  end

  # Models should have behavior; this method represents a moment in time  
  def funded_by(user)
    self.update(:funder_user => user)
    save
  end

  def funded?
    # Force method to respond with a boolean with true or nil
    true if funder_user
  end

  def thanked?(dream)
    !!dream.thanks == true
  end

  def add_thanks(dream)
    self.update(:thanks => dream.thanks)
    save
  end
end
