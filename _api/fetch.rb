parsed_url = URI.parse("https://www.swapi.tech/api/people/")
response = Net::HTTP.get_response(parsed_url)
characters_array = JSON.parse(response.body)["results"]

characters_array.each do |character|
  url = character["url"]
  name = character["name"]

  parsed_char_url = URI.parse(url)
  url_response = Net::HTTP.get_response(parsed_char_url)
  char_hash = JSON.parse(url_response.body)
  planet_url = char_hash["result"]["properties"]["homeworld"]

  parsed_homeworld_url = URI.parse(planet_url)
  planet_url_response = Net::HTTP.get_response(parsed_homeworld_url)
  planet_hash = JSON.parse(planet_url_response.body)
  planet_name = planet_hash["result"]["properties"]["name"]

  planet = Planet.find_or_create_by_name(planet_name)
  character = Character.new(name, planet)

end
