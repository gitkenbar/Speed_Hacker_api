class Game < ApplicationRecord
  # Validations
  validates :name, presence: true, uniqueness:true, length: {minimum: 4, maximum: 25}
  validates :content_id, presence: true
  validates :user_id, presence: true


  # Associations
  #has_one :language
  has_many :scores
  has_one :content
  belongs_to :user
end
