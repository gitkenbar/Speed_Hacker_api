class Game < ApplicationRecord
  # Validations
  validates :name, presence: true, uniqueness:true
  validates :content_id, presence: true
  validates :user_id, presence: true


  # Associations
  #has_one :language
  has_many :scores
  has_one :content
  belongs_to :user
end
