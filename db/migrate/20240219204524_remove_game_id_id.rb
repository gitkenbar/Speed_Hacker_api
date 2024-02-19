class RemoveGameIdId < ActiveRecord::Migration[7.1]
  def change
    change_table :scores do |t|
      t.remove :game_id_id
    end
  end
end
