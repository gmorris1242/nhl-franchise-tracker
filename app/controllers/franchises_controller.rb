class FranchisesController < ApplicationController
  before_action :authenticate_user!
  require 'httparty'
  include ApplicationHelper

  def index
    @franchises = Franchise.where(user_id: current_user.id)
  end

  def create
    @franchise = Franchise.new(franchise_params)
    @franchise.seasons.new(year: '2019-20').save
    @franchise.seasons.first.build_stat.save

    response = HTTParty.get("https://statsapi.web.nhl.com/api/v1/teams/#{get_team_id[@franchise.name]}/roster")
    roster = response.parsed_response['roster']

    roster.each do |roster_spot|


      player = {
        name: roster_spot['person']['fullName'],
        position: roster_spot['position']['name'] == 'Defenseman' ? 'Left Defense' : roster_spot['position']['name'],
        salary: 0,
        contract_length: 0,
        overall: 55,
        age: 18,
        acquired: 'Free Agent',
        season_id: @franchise.seasons.first.id,
        img: '',
        player_type: 'TWF',
        real_life_team: @franchise.name,
        league: 'NHL',
        morale: 'Unknown'
      }

      @franchise.seasons.first.players.new(player).save
    end

    if @franchise.save
      redirect_to franchises_path
    else
      render 'new'
    end
  end

  def destroy
    @franchise =  Franchise.find(params[:id])
    @franchise.destroy

    flash[:notice] = 'Post Deleted.'
    redirect_to root_path
  end

  private

  def franchise_params
    params.require(:franchise).permit(:name, :user_id)
  end
end
