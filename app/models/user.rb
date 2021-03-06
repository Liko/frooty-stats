class User < ApplicationRecord
    has_many :favourites
    has_many :clubs, through: :favourites 
    
    has_secure_password

    validates :username, :email, uniqueness: true
    validates :username, :email, :password, presence: true
    validates :password, confirmation: true

    def self.favourited(user_id, club_id)
        Favourite.find_by(user_id: user_id, club_id: club_id)
    end
end
