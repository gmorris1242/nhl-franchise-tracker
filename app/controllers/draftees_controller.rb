class DrafteesController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_wrong_user

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

    flash[:notice] = 'Player Deleted.'
    redirect_to franchise_seasons_path
  end

  private

  def draftee_params
    params.require(:draftee).permit(:name, :round, :position, :potential,
                                   :season_id, :player_type, :draft_position);
  end

  def redirect_wrong_user
    redirect_to :root unless Franchise.find(params[:franchise_id]).user_id == current_user.id
  end
end
