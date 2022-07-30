class User < ApplicationRecord
    has_many :dream_requests, :class_name => "Dream", :foreign_key => "dreamer_user_id", dependent: :destroy
    has_many :dreams_funded, :class_name => "Dream", :foreign_key => "funder_user_id"
    accepts_nested_attributes_for :dream_requests, reject_if: :reject_dream_requests, allow_destroy: true
    
    validates :email, :presence => true
    
    # Are these has many through, correct??
    has_many :funder_users, :class_name => "User", through: :dreams_funded
    has_many :dreamer_users, :class_name => "User", through: :dream_requests

    has_secure_password

    scope :all_users_alphabetized, -> { order(:email) } 

    def reject_dream_requests(attributes)
        attributes['name', 'cost'].blank?
    end

    def self.from_omniauth(auth)
        self.find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |u|
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(20)
        end
    end

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
