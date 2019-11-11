require 'json'


def import_json
    file = File.read("#{__dir__}/league_2012_data.json")
    data_hash = JSON.parse(file)
end

def model_data(data_hash)

    country_hash = getCountries(data_hash)
    stadium_hash = getStadiums(data_hash)
    competition_array = getCompetitions(data_hash)
    club_array = getClubs(data_hash)
    position_hash = getPositions
    player_array = getPlayers(data_hash)

    data = {
        :country_hash => country_hash,
        :stadium_hash => stadium_hash,
        :competition_array => competition_array,
        :club_array => club_array,
        :position_hash => position_hash, 
        :player_array => player_array
    }

  
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

def getStadiums(data_hash)
    matches = data_hash["matches"]["data"]
    stadiums_hash = {}

    stadiums_array = matches.map{|match| {match["homeID"] => match["stadium_name"]}}.uniq.select{|stadium| stadium.values[0].size > 0}

    stadiums_array.each{|stadium| stadiums_hash[stadium.keys[0]] = stadium.values[0]}

    stadiums_hash
end

def getCompetitions(data_hash)
    competition_array = [] 

    competition = {}
    
    competition[:fs_league_id] = 2012
    competition[:name] = "Premier League 2019/2020"

    competition_array << competition

    competition_array
end

def getClubs(data_hash)
    club_array = []
    club_hash = data_hash["teams"]["data"]

    club_hash.map do |c|
        club = {}
        club[:fs_club_id] = c["id"]
        club[:fs_league_id] = c["competition_id"]
        club[:name] = c["name"]
        club[:shorthand] = c["shortHand"]
        club[:country] = c["country"]
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

def getPlayers(data_hash)
    player_array = []
    player_hash = data_hash["players"]["data"]

    player_hash.map do |p|
        player = {}
        player[:name] = p["known_as"]
        player[:shorthand] = p["shorthand"]
        check_edge_case_nationalities(p)
        player[:country] = p["nationality"]
        player[:birthday] = p["birthday"]
        player[:position] = p["position"]
        player[:fs_club_id] = p["club_team_id"]
        player_array << player
    end
    #still potentially missing player stats like goals, assists etc
    player_array
end

def check_edge_case_nationalities(p)
    if p["nationality"] == "Côte d'Ivoire"
        p["nationality"] = "Ivory Coast"
    end
end


def run_json_to_seed
    data_hash = import_json
    model_data(data_hash)
end

run_json_to_seed
