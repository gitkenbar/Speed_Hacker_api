class User < ApplicationRecord
  #validations
  validates :username, presence:true, uniqueness:true, length: {minimum: 3, maximum: 20}
    validates :password, presence:true, length: {minimum: 6, maximum: 25}
  
  has_many :languages
  has_many :games
  has_many :scores
  #Issue: cannot create user with multiple languages

  #possible solution: Create a UserLanguage join table that can hold user_ids and language_ids
end
