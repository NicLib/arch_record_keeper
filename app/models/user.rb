class User < ApplicationRecord
    validates :username, presence: true
    has_secure_password

    #Returns the has digest of the given string
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engin.cost

        Bcrypt::Password.create(string, cost: cost)
    end
end
