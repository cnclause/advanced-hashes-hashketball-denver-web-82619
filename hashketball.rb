require "pry"

def game_hash
  {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
      {
      :name => "Alan Anderson",
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
      },
      {
      :name => "Reggie Evans",
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
      },
      {
      :name => "Brook Lopez",
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
      },
      {
      :name => "Mason Plumlee",
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 11,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
      },
      {
      :name => "Jason Terry",
      :number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1
      }
    ]
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      {
      :name => "Jeff Adrien",
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2
      },
      {
      :name => "Bismack Biyombo", 
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 22,
      :blocks => 15,
      :slam_dunks => 10
      },
      {
      :name => "DeSagna Diop", 
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
      },
      {
      :name => "Ben Gordon",
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
      },
      {
      :name => "Kemba Walker",
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 7,
      :blocks => 5,
      :slam_dunks => 12
      }
    ]
  }
}
end


def num_points_scored (name)
points = nil 
  game_hash.each do |team, hash|
    players_array = hash[:players]
      players_array.each do |player_hash|
        if player_hash[:name] == name
           player_hash[:points] 
           points = player_hash[:points] 
        end
      end
  end
points
end 

def shoe_size (name)
size = nil 
  game_hash.each do |team, hash|
    players_array = hash[:players]
      players_array.each do |player_hash|
        if player_hash[:name] == name
           player_hash[:shoe] 
           size = player_hash[:shoe] 
        end
      end
  end
size
end 

def team_colors (team_name)
    colors = nil
    game_hash.each do |team, team_details_hash|
        if team_details_hash[:team_name] == team_name
            colors = team_details_hash[:colors]
        end
    end
    colors
end 

def team_names
  game_hash.collect do |team, team_details_hash|
    team_details_hash[:team_name] 
  end
end

def player_numbers (team_name)
  player_numbers_list = []
  game_hash.each do |team, team_details_hash|
    if team_details_hash[:team_name] == team_name
      team_details_hash[:players].each do |player|
        player.each do |key, value|
          if key == :number 
            player_numbers_list << value
          end
        end
      end
    end
  end
  player_numbers_list
end 



def player_stats(player_name)
  player_stats = {}
  game_hash.each do |team, team_details_hash|
    team_details_hash[:players].each do |stats|

      if stats[:name] == player_name
        stats.delete(:name)
        player_stats = stats
      end
    end
  end
  player_stats
end

def big_shoe_rebounds
  big_shoes_guy = 0
  rebounds = 0
    game_hash.each do | team, team_details_hash|
      team_details_hash[:players].each do | stats |
        if stats[:shoe] > big_shoes_guy
          big_shoes_guy = stats[:shoe]
          rebounds = stats[:rebounds]
        end
      end
    end
  rebounds
end 

def most_points_scored
  most_points = 0
  mvp = ''
  game_hash.each do |home_away, keys|
    keys[:players].each do |player|
      points = player[:points]
      if points > most_points
        most_points = points
        mvp = player[:name]
      end
    end
  end
  mvp
end

 def winning_team
  total_points = 0
  win_team = ''
  game_hash.each do |home_away, keys|
    team_points = 0
    team_name = game_hash[home_away][:team_name]
    keys[:players].each do |player|
      points = player[:points]
      team_points += points
    end
    win_team, total_points = team_name, team_points if team_points > total_points
  end
  return win_team
end

 def player_with_longest_name
  longest = ''
  longest_length = 0
  game_hash.each do |home_away, keys|
    keys[:players].each do |player|
      name_length = player[:name].length
      longest, longest_length = player[:name], name_length if name_length > longest_length
    end
  end
  return longest
end



 def long_name_steals_a_ton?
  steals_most = ''
  most_steals = 0
  game_hash.each do |home_away, keys|
    keys[:players].each do |player|
      steals_most, most_steals = player[:name], player[:steals] if player[:steals] > most_steals
    end
  end
  return true if steals_most == player_with_longest_name
end
