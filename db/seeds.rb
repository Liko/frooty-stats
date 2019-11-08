require_relative 'data_generation/json_to_seed'


def run


    # Country.destroy_all
    # Position.destroy_all 

    data = run_json_to_seed

    countries = seed_countries(data)
    positions = seed_positions(data)

    teams = seed_teams(data)

end

def seed_countries(data)
    countries = data[:country_hash].keys
    countries.each do |country|
        Country.create(name: country)    
    end
end

def seed_positions(data)
    positions = data[:position_hash].keys
    positions.each do |position|
        Position.create(name: position)
    end
end

def seed_teams(data)

end

run