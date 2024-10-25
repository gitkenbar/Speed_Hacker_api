class User < ApplicationRecord
  has_secure_password

  #validations
    validates :username, presence:true, uniqueness:true, length: {minimum: 3, maximum: 20}
    validates :password, presence:true,
    length: {minimum: 5, maximum: 20}
  
  #associations
    has_many :games
    has_many :scores
    has_many :flashcards

end
