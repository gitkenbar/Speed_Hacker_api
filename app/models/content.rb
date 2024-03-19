class Content < ApplicationRecord
    # Validations
    validates :challenge, presence:true

    # Associations
    #belongs_to :game
end
