module ApplicationHelper
  require 'HTTParty'

  def get_seasons_for_nav()
    @seasons =  Season.where(franchise_id: params[:franchise_id])
  end

  def get_team_logo(team)
    "https://www-league.nhlstatic.com/images/logos/teams-current-primary-light/#{get_team_id[team]}.svg"
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

  def get_player_image(player)
    players = {}

    response = HTTParty.get("https://statsapi.web.nhl.com/api/v1/teams/#{get_team_id[player.real_life_team]}/roster")
    roster = response.parsed_response['roster']

    unless roster.nil?
      roster.each do |roster_spot|
        players[roster_spot['person']['fullName']] = roster_spot['person']['id']
      end
    end

    if players[player.name].nil?
      player.img.empty? ? 'placeholder.jpg' : player.img
    else
      "https://nhl.bamcontent.com/images/headshots/current/168x168/#{players[player.name]}.jpg"
    end
  end

  def display_salary(salary)
    number_with_delimiter(salary.to_i, :delimiter => ',')
  end

  private

  def get_team_id
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
  end

  def get_player_types
    [
      'PLY',
      'SNP',
      'TWF',
      'GRN',
      'ENF',
      'OFD',
      'TWD',
      'DFD',
      'HYB',
      'BUT',
      'STD'
    ]
  end
end
