class User < ActiveRecord::Base
    validates :password, presence: true
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password

    def mood
        if admin == false
            if happiness < nausea
                "sad"
            else
                "happy"
            end
        end
    end
end
