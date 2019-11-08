
require_relative 'data_generation/json_to_seed'

data = run

countries = data[:country_hash].keys
countries.each do |country|
    Country.create(name: country)
end
