class AddStanleyCupChampToStats < ActiveRecord::Migration[6.0]
  def change
    add_column :stats, :stanley_cup_champ, :string
  end
end
