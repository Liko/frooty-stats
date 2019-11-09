require_relative 'data_generation/json_to_seed'
# require 'pry'


def run
    Country.destroy_all
    Position.destroy_all 
    Club.destroy_all

    data = run_json_to_seed

    countries = seed_countries(data)
    positions = seed_positions(data)
    clubs = seed_clubs(data)

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
    countries = data[:country_hash]
    clubs = data[:club_array]
    clubs.each do |club|
        Club.create(
            name: club[:name],
            shorthand: club[:shorthand],
            country_id: Country.find_by(name:club[:country]).id,
            image: club[:image],
            founded: club[:founded],
            stadium_id: nil
        )
    end
    puts "Clubs seeded"

end

run