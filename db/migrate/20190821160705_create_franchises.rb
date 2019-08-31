class CreateFranchises < ActiveRecord::Migration[6.0]
  def change
    create_table :franchises do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
    add_index :franchises, :created_at, unique: true
  end
end
