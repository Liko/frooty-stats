require 'json'
require 'pry'


def import_json
    file = File.read('league_2012_data.json')
    data_hash = JSON.parse(file)
end

def model_data(data_hash)

    country_hash = getCountries(data_hash)
    club_array = getClubs(data_hash, country_hash)
    position_hash = getPositions
    player_array = getPlayers(data_hash, country_hash, club_array, position_hash)

    binding.pry
    
    
end

def getCountries(data_hash)
    country_array = data_hash["countries"]["data"].map{|country|country["name"]}.sort
    country_hash = {}
    country_array.each_with_index do |country, i|
        country_hash[country] = i+1
    end
    country_hash
    #country_hash is hash of hashes {country:id}
end

def getClubs(data_hash, country_hash)
    club_array = []
    club_hash = data_hash["teams"]["data"]

    club_hash.map do |c|
        club = {}
        club[:club_id] = c["id"]
        club[:name] = c["name"]
        club[:shorthand] = c["shortHand"]
        club[:country_id] = country_hash[c["country"]]
        club[:image] = c["image"]
        club[:founded] = c["founded"].to_i
        club[:stadium_id] = nil
        club_array << club
    end
    #clubs array has hashes of clubs with required data, except stadium_id=>nil
    club_array
end

def getPositions
    position_hash = {
        "Goalkeeper" => 1,
        "Defender" => 2,
        "Midfielder" => 3,
        "Forward" => 4
    }
end

def getPlayers(data_hash, country_hash, club_array, position_hash)
    player_array = []
    player_hash = data_hash["players"]["data"]

    player_hash.map do |p|
        player = {}
        player[:name] = p["known_as"]
        player[:shorthand] = p["shorthand"]
        player[:country_id] = country_hash[p["nationality"]]
        player[:birthday] = p["birthday"]
        player[:position_id] = position_hash[p["position"]]
        player[:club_id] = club_array.select{|club|club[:club_id]==p["club_team_id"]}.map{|club|club[:club_id]}[0]
        player_array << player
    end
    #still potentially missing player stats like goals, assists etc
    player_array
end


def run
    data_hash = import_json
    model_data(data_hash)
end

run
