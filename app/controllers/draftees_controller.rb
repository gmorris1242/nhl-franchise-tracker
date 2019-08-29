class DrafteesController < ApplicationController
  def index
    @draftees = Draftee.where(season_id: params[:season_id])
  end

  def create
    @draftee = Draftee.new(draftee_params)
    @draftee.save

    redirect_to franchise_season_draftees_path
  end

  def edit
    @draftee = Draftee.find(params[:id])
  end

  def update
    @draftee = Draftee.where(season_id: params[:season_id], id: params[:id])

    if @draftee.update(draftee_params)
      redirect_to franchise_season_draftees_path
    else
      redirect_to franchise_season_draftees_path
    end
  end
  #
  def destroy
    @draftee = Draftee.where(season_id: params[:season_id], id: params[:id])
    @draftee.first.destroy

    flash[:notice] = 'Post Deleted.'
    redirect_to franchise_seasons_path
  end

  private

  def draftee_params
    params.require(:draftee).permit(:name, :round, :year, :position, :potential,
                                   :season_id, :player_type);
  end
end
