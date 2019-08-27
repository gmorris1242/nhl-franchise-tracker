class StatsController < ApplicationController
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
end
