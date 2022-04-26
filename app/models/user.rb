class User < ApplicationRecord
    has_many :dream_requests, :class_name => "Dream", :foreign_key => "dreamer_user_id", dependent: :destroy
    has_many :dreams_funded, :class_name => "Dream", :foreign_key => "funder_user_id", dependent: :destroy

    has_many :funder_users, :class_name => "User", through: :dreams_funded
    has_many :dreamer_users, :class_name => "User", through: :dream_requests

    has_secure_password

end
