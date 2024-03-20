class User < ApplicationRecord
  has_secure_password

  #validations
    validates :username, presence:true, uniqueness:true, length: {minimum: 3, maximum: 20}
  
  #associations
    has_many :games
    has_many :scores
  #Issue: cannot create user with multiple languages

  #possible solution: Create a LanguageUser join table that can hold user_ids and language_ids
end
