class AddRealLifeTeamToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :real_life_team, :string
  end
end
