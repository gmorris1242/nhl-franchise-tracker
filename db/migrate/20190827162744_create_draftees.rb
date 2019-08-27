class CreateDraftees < ActiveRecord::Migration[6.0]
  def change
    create_table :draftees do |t|
      t.belongs_to :season, index: true
      t.string :name
      t.integer :round
      t.integer :year
      t.string :position
      t.string :potential
      t.string :player_type

      t.timestamps
    end
  end
end
