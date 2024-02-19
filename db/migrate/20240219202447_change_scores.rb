class ChangeScores < ActiveRecord::Migration[7.1]
  def change
    change_table :scores do |t|
      t.remove :set_id
      t.references :game
    end
  end
end
