class User < ApplicationRecord
  #validations
  validates :username, presence:true, uniqueness:true, length: {minimum: 3, maximum: 20}
    validates :password, presence:true, length: {minimum: 6, maximum: 25}
  
  has_many :language
  #Issue: cannot create user with multiple languages
end
