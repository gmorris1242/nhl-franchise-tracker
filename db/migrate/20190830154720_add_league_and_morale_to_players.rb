class AddLeagueAndMoraleToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :league, :string
    add_column :players, :morale, :string
  end
end
