module ApplicationHelper
  def get_seasons_for_nav()
    @seasons =  Season.where(franchise_id: params[:franchise_id])
  end

  def get_team_logo(team)
    logos = {
      'Detroit Red Wings' => 17,
      'Minnesota Wild' => 30,
      'New York Islanders' => 2
    }


    "https://www-league.nhlstatic.com/images/logos/teams-current-primary-light/#{logos[team]}.svg"
  end
end
