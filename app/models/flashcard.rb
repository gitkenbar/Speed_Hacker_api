class Flashcard < ApplicationRecord
  # Validations
  validates :name, presence: true, uniqueness: true, length: {minimum: 4, maximum: 25}
  validates :content_id, presence: true
  validates :definition_id, presence: true
  validates :user_id, presence: true

  #Associations

  has_one :content
  has_one :definition
  belongs_to :user
end