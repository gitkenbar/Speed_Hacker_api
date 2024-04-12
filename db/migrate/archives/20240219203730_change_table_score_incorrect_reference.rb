class ChangeTableScoreIncorrectReference < ActiveRecord::Migration[7.1]
  def change
    remove_reference :scores, :game_id_id

    add_reference :scores, :game, foreign_key: true
  end
end
