class SeasonsController < ApplicationController
  def index
    @seasons = Season.where(franchise_id: params[:franchise_id])
  end

  def create
    @season = Season.new(season_params)
    @season.save
    @season.build_stat.save

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
end
