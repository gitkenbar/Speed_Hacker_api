class FlashcardBlueprint < Blueprinter::Base
  identifier :id
  
  view :normal do
    fields :name, :user_id, :created_at, :updated_at
  end
end