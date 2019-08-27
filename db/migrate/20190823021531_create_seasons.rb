class CreateSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :seasons do |t|
      t.string :year
      t.belongs_to :franchise, index: true

      t.timestamps
    end
    add_index :seasons, :created_at, unique: true
  end
end
