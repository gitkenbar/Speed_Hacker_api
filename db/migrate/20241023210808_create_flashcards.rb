class CreateFlashcards < ActiveRecord::Migration[7.1]
  def change
    create_table :flashcards do |t|
      t.string :name
      t.integer :content_id
      t.integer :definition_id
      t.integer :user_id

      t.timestamps
    end
  end
end
