module ApplicationHelper
  def get_seasons_for_nav()
    @seasons =  Season.where(franchise_id: params[:franchise_id])
  end

  def get_team_logo(team)
    logos = {
      'Detroit Red Wings' => 17,
      'Minnesota Wild' => 30,
      'New York Islanders' => 2,
      'New Jersey Devils' => 1
    }

    "https://www-league.nhlstatic.com/images/logos/teams-current-primary-light/#{logos[team]}.svg"
  end

  def organize_roster(players, position)
    players = players.sort_by{ |player|  player.overall }.reverse

    centers = []
    left_wingers = []
    right_wingers = []
    left_defensemen = []
    right_defensemen = []
    goalies = []

    players.each do |player|
      case player.position
      when 'Center'
        centers.push(player)
      when 'Left Wing'
        left_wingers.push(player)
      when 'Right Wing'
        right_wingers.push(player)
      when 'Left Defense'
        left_defensemen.push(player)
      when 'Right Defense'
        right_defensemen.push(player)
      when 'Goalie'
        goalies.push(player)
      end
    end

    case position
    when 'Center'
      centers
    when 'Left Wing'
      left_wingers
    when 'Right Wing'
      right_wingers
    when 'Left Defense'
      left_defensemen
    when 'Right Defense'
      right_defensemen
    when 'Goalie'
      goalies
    end
  end

  def import_roster

  end
end
