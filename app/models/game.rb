class Game < ApplicationRecord
  # Validations
  validates :name, presence: true, uniqueness:true
  validates :content_id, presence: true
  validates :difficulty, presence: true
  validates :user_id, presence: true
  validates :language_id, presence: true


  # Associations
  belongs_to :content
  belongs_to :user
  belongs_to :language
end
