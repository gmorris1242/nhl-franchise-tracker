class StatsController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_wrong_user

  def index
    @stats = Stat.where(season_id: params[:season_id])
  end

  def edit
    @stats = Stat.where(season_id: params[:season_id])
  end

  def update
    @stats = Stat.where(season_id: params[:season_id])

    if @stats.update(stat_params)
      render :index
    else
      render :index
    end
  end

  private

  def stat_params
    params.require(:stat).permit(:wins, :losses, :overtime_losses, :points,
                                 :goal_leader, :assist_leader, :points_leader,
                                 :wins_leader, :results, :notes, :goal_total,
                                 :assist_total, :points_total, :wins_total)
  end

  def redirect_wrong_user
    redirect_to :root unless Franchise.find(params[:franchise_id]).user_id == current_user.id
  end
end
