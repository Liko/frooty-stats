require_relative 'data_generation/json_to_seed'
# require 'pry'


def run
    remove_old_seeds

    data = run_json_to_seed
    
    countries = seed_countries(data)
    positions = seed_positions(data)
    competitions = seed_competitions(data)
    stadia = seed_stadia(data)
    clubs = seed_clubs(data)
    players = seed_players(data)
    player_stats = seed_player_stats(data)
    club_stats = seed_club_stats(data)
    matches = seed_matches(data)
    seed_users
  
end

def remove_old_seeds
    Country.destroy_all
    puts "Countries cleared"

    Position.destroy_all 
    puts "Positions cleared"

    Stadium.destroy_all
    puts "Stadia cleared"

    Club.destroy_all
    puts "Clubs cleared"

    Player.destroy_all
    puts "Players cleared"

    PlayerStat.destroy_all
    puts "Player stats cleared"

    ClubStat.destroy_all
    puts "Club stats cleared"

    Match.destroy_all
    puts "Matches cleared"

    User.destroy_all
    puts "Users cleared"

end

def seed_countries(data)
    countries = data[:country_hash].keys
    countries.each do |country|
        Country.create(name: country)    
    end
    puts "Countries seeded"
end

def seed_positions(data)
    positions = data[:position_hash].keys
    positions.each do |position|
        Position.create(name: position)
    end
    puts "Positions seeded"
end

def seed_competitions(data)
    competitions = data[:competition_array]
    competitions.each do |comp|
        Competition.create(fs_league_id: comp[:fs_league_id], name: comp[:name])
    end
    puts "Competitions seeded"
end

def seed_stadia(data)
    stadia = data[:stadium_hash]
    stadia.each do |stadium|
        Stadium.create(fs_club_id: stadium[0], name: stadium[1])
    end
    puts "Stadia seeded"
end

def seed_clubs(data)
    clubs = data[:club_array]
    stadiums = data[:stadium_hash]
    clubs.each do |c|
        Club.create(
            name: c[:name],
            shorthand: c[:shorthand],
            country_id: Country.find_by(name:c[:country]).id,
            image: c[:image],
            founded: c[:founded],
            fs_club_id: c[:fs_club_id],
            competition_id: Competition.find_by(fs_league_id:c[:fs_league_id]).id,
            stadium_id: Stadium.find_by(fs_club_id:c[:fs_club_id]).id
        )
    end
    puts "Clubs seeded"

end

def seed_players(data)
    players = data[:player_array]
    players.each do |p|
        Player.create(
            name: p[:name],
            shorthand: p[:shorthand],
            country_id: Country.find_by(name:p[:country]).id,
            birthday: p[:birthday],
            position_id: Position.find_by(name:p[:position]).id,
            club_id: Club.find_by(fs_club_id:p[:fs_club_id]).id,
            fs_player_id: p[:fs_player_id],
            competition_id: Competition.find_by(fs_league_id:p[:fs_competition_id]).id
        )     
    end
    puts "Players seeded"
end

def seed_player_stats(data)
    player_stats = data[:player_stats_array]
    player_stats.each do |p|
        PlayerStat.create(
            player_id: Player.find_by(fs_player_id:p[:fs_player_id]).id,
            appearances_overall: p[:appearances_overall],
            minutes_played_overall: p[:minutes_played_overall],
            goals_overall: p[:goals_overall],
            clean_sheets_overall: p[:clean_sheets_overall],
            conceded_overall: p[:conceded_overall],
            penalty_goals: p[:penalty_goals],
            penalty_misses: p[:penalty_misses],
            assists_overall: p[:assists_overall],
            yellow_cards_overall: p[:yellow_cards_overall],
            red_cards_overall: p[:red_cards_overall]
        )
    end
    puts "Player Stats seeded"
end

def seed_club_stats(data)
    club_stats = data[:club_stats_array]
    club_stats.each do |c|
        ClubStat.create(
            club_id: Club.find_by(fs_club_id:c[:fs_club_id]).id,
            seasonGoals_overall: c[:seasonGoals_overall],
            seasonConceded_overall: c[:seasonConceded_overall],
            seasonWinsNum_overall: c[:seasonWinsNum_overall],
            seasonDrawsNum_overall: c[:seasonDrawsNum_overall],
            seasonLossesNum_overall: c[:seasonLossesNum_overall],
            seasonMatchesPlayed_overall: c[:seasonMatchesPlayed_overall],
            seasonCS_overall: c[:seasonCS_overall],
            leaguePosition_overall: c[:leaguePosition_overall],
            average_attendance_home: c[:average_attendance_home],
            cornersTotal_overall: c[:cornersTotal_overall],
            shotsTotal_overall: c[:shotsTotal_overall],
            shotsOnTargetTotal_overall: c[:shotsOnTargetTotal_overall],
            possessionAVG_overall: c[:possessionAVG_overall],
            foulsTotal_overall: c[:foulsTotal_overall],
            offsidesTotal_overall: c[:offsidesTotal_overall]
        )
    end
    puts "Club Stats seeded"
end

def seed_matches(data)
    matches = data[:matches_array]
    matches.each do |m|
        Match.create(
            home_id: Club.find_by(fs_club_id:m[:home_id]).id,
            away_id: Club.find_by(fs_club_id:m[:away_id]).id,
            home_goal_count: m[:home_goal_count],
            away_goal_count: m[:away_goal_count],
            stadium_id: Stadium.find_by(name:m[:stadium_name]).id,
            date: m[:date],
            attendance: m[:attendance],
            status: m[:status],
            fs_match_id: m[:fs_match_id],
            competition_id: Competition.find_by(fs_league_id:m[:fs_competition_id]).id,
            game_week: m[:game_week],
            winningTeam: Club.find_by(fs_club_id:m[:winningTeam]).id,
            team_a_corners: m[:team_a_corners],
            team_b_corners: m[:team_b_corners],
            team_a_offsides: m[:team_a_offsides],
            team_b_offsides: m[:team_b_offsides],
            team_a_yellow_cards: m[:team_a_yellow_cards],
            team_b_yellow_cards: m[:team_b_yellow_cards],
            team_a_red_cards: m[:team_a_red_cards],
            team_b_red_cards: m[:team_b_red_cards],
            team_a_shotsOnTarget: m[:team_a_shotsOnTarget],
            team_b_shotsOnTarget: m[:team_b_shotsOnTarget],
            team_a_shots: m[:team_a_shots],
            team_b_shots: m[:team_b_shots],
            team_a_fouls: m[:team_a_fouls],
            team_b_fouls: m[:team_b_fouls],
            team_a_possession: m[:team_a_possession],
            team_b_possession: m[:team_b_possession]
        )
    end
    puts "Matches seeded"
end

def seed_users
    users_arr = [
        {username: "testuser1", email: "user1@gmail.com", password: "user1", password_confirmation: "user1"},
        {username: "testuser2", email: "user2@gmail.com", password: "user2", password_confirmation: "user2"},
        {username: "testuser3", email: "user3@gmail.com", password: "user3", password_confirmation: "user3"}
    ]
    User.create(users_arr)
end

run