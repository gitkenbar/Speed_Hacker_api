class RemoveLanguageFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :language_id, :integer
  end
end
