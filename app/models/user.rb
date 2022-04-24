class User < ApplicationRecord
    has_many :dream_requests, :class_name => "Dream", :foreign_key => "dreamer_user_id"
    has_many :dreams_funded, :class_name => "Dream", :foreign_key => "funder_user_id"

    has_secure_password
    
end
