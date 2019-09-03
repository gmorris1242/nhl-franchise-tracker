class PagesController < ApplicationController

  def records
    redirect_to :root unless current_user
    @seasons = []
    franchises  = Franchise.where(user_id: current_user.id)
    franchises.each do |franchise|
      franchise.seasons.each do |season|
        @seasons.push(season)
      end
    end
  end
end
