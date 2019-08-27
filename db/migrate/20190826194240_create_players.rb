class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :img
      t.string :position
      t.float :salary
      t.integer :contract_length
      t.integer :overall
      t.integer :age
      t.string :player_type
      t.text :acquired
      t.belongs_to :season, index: true

      t.timestamps
    end
  end
end
