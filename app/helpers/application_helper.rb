module ApplicationHelper
  def get_seasons_for_nav()
    @seasons =  Season.where(franchise_id: params[:franchise_id])
  end

  def get_team_logo(team)
    logos = {
      'Anaheim Ducks' => 24,
      'Arizona Coyotes' => 53,
      'Boston Bruins' => 6,
      'Buffalo Sabres' => 7,
      'Calgary Flames' => 20,
      'Carolina Hurricanes' => 12,
      'Chicago Blackhawks' => 16,
      'Colorado Avalanche' => 21,
      'Columbus Blue Jackets' => 29,
      'Dallas Stars' => 25,
      'Detroit Red Wings' => 17,
      'Edmonton Oilers' => 22,
      'Florida Panthers' => 13,
      'Los Angeles Kings' => 26,
      'Minnesota Wild' => 30,
      'Montreal Canadiens' => 8,
      'Nashville Predators' => 18,
      'New Jersey Devils' => 1,
      'New York Islanders' => 2,
      'New York Rangers' => 3,
      'Ottawa Senators' => 9,
      'Philadelphia Flyers' => 4,
      'Pittsburgh Penguins' => 5,
      'San Jose Sharks' => 28,
      'St. Louis Blues' => 19,
      'Tampa Bay Lightning' => 14,
      'Toronto Maple Leafs' => 10,
      'Vancouver Canucks' => 23,
      'Vegas Golden Knights' => 54,
      'Washington Capitals' => 15,
      'Winnipeg Jets' => 52
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
