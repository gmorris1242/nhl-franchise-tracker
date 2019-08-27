class CreateStats < ActiveRecord::Migration[6.0]
  def change
    create_table :stats do |t|
      t.integer :wins
      t.integer :losses
      t.integer :overtime_losses
      t.integer :points
      t.string :results
      t.string :goal_leader
      t.string :assist_leader
      t.string :points_leader
      t.string :wins_leader
      t.text :notes
      t.belongs_to :season, index: true

      t.timestamps
    end
  end
end
