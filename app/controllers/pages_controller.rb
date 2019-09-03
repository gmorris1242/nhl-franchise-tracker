class PagesController < ApplicationController
  before_action :authenticate_user!

  def records
    @seasons = []
    franchises  = Franchise.where(user_id: current_user.id)
    franchises.each do |franchise|
      franchise.seasons.each do |season|
        @seasons.push(season)
      end
    end
  end

end
