class CreateDefinitions < ActiveRecord::Migration[7.1]
  def change
    create_table :definitions do |t|
      t.string :definition

      t.timestamps
    end
  end
end
