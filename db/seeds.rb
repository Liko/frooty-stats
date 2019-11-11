require_relative 'data_generation/json_to_seed'


def run
    remove_old_seeds

    data = run_json_to_seed

    countries = seed_countries(data)
    positions = seed_positions(data)
    clubs = seed_clubs(data)
    players = seed_players(data)
end

def remove_old_seeds
    Country.destroy_all
    puts "Countries cleared"
    Position.destroy_all 
    puts "Positions cleared"
    Club.destroy_all
    puts "Clubs cleared"
    Player.destroy_all
    puts "Players cleared"
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

def seed_clubs(data)
    clubs = data[:club_array]
    clubs.each do |c|
        Club.create(
            name: c[:name],
            shorthand: c[:shorthand],
            country_id: Country.find_by(name:c[:country]).id,
            image: c[:image],
            founded: c[:founded],
            fs_club_id: c[:fs_club_id],
            stadium_id: nil
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
            club_id: Club.find_by(fs_club_id:p[:fs_club_id]).id
        )
    end
    puts "Players seeded"
end

run