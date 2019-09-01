class SeasonsController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_wrong_user


  def index
    @seasons = Season.where(franchise_id: params[:franchise_id])
  end

  def create
    @season = Season.new(season_params)
    @season.save
    @season.build_stat.save

    # COPIES LAST YEARS ROSTER OVER

    franchise = Franchise.find(params[:franchise_id])
    last_season = franchise.seasons.count - 2

    last_seasons_players = franchise.seasons[last_season].players

    last_seasons_players.each do |player|
      player_copy = player.dup

      player_copy.contract_length = player_copy.contract_length > 0 ? player_copy.contract_length - 1 : player_copy._contract_length
      player_copy.age = player_copy.age + 1

      Player.new(player_copy.attributes.merge(season_id: @season.id)).save
    end

    redirect_to franchise_seasons_path
  end

  def destroy
    @season =  Season.where(franchise_id: params[:franchise_id], id: params[:id])
    @season.first.destroy

    flash[:notice] = 'Post Deleted.'
    redirect_to franchise_seasons_path
  end

  private

  def season_params
    params.require(:season).permit(:year, :franchise_id);
  end

  def redirect_wrong_user
    redirect_to :root unless Franchise.find(params[:franchise_id]).user_id == current_user.id unless Franchise.all.count == 0
  end
end
