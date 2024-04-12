class RemoveLanguageFromGames < ActiveRecord::Migration[7.1]
  def change
    remove_column :games, :language_id, :integer
    remove_column :games, :difficulty, :integer
  end
end
