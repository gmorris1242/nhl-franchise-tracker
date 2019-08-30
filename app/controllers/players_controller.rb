class PlayersController < ApplicationController
  def index
    @players = Player.where(season_id: params[:season_id])
  end

  def create
    @player = Player.new(player_params)
    @player.save

    redirect_to franchise_season_players_path
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.where(season_id: params[:season_id], id: params[:id])

    if @player.update(player_params)
      redirect_to franchise_season_players_path
    else
      redirect_to franchise_season_players_path
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    flash[:notice] = 'Post Deleted.'
    redirect_to franchise_season_players_path
  end

  def show
    @player = Player.find(params[:id])
  end

  private

  def player_params
    params.require(:player).permit(:name, :season_id, :img, :position, :salary,
                                   :contract_length, :overall, :age,
                                   :player_type, :acquired, :real_life_team,
                                   :league, :morale);
  end
end
