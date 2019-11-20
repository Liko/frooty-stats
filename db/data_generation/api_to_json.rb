require 'httparty'
require 'json'

def run_api_to_json
    api_data_to_file
end

def api_data_to_file
    url_keywords = ["teams", "players", "matches", "tables", "season"]
    league_ids = [2012]
    data = {}
    timestamp = Time.now.to_i
    filename = "#{timestamp}_league_#{league_ids[0]}_data.json"

    url_keywords.map do |url_keyword|
        url = "https://api.footystats.org/league-#{url_keyword}?key=example&include=stats&league_id=#{league_ids[0]}"
        data["#{url_keyword}"] = convert_api_response_to_hash(url)
    end

    data["countries"] = convert_api_response_to_hash("https://api.footystats.org/country-list?key=example")

    save_hash_to_file(data.to_json, filename)
end 

def convert_api_response_to_hash(url)
    response = HTTParty.get(url)
    response_hash = response.parsed_response
end

def save_hash_to_file(hash,filename)
    File.write(filename, hash)
end

run_api_to_json


