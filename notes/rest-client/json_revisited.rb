require 'json'
require 'rest-client'

res_JSON = RestClient.get "http://api.open-notify.org/iss-now.json"

iss_data = JSON.load(res_JSON)

latitude = iss_data["iss_position"]["latitude"]
longitude = iss_data["iss_position"]["longitude"]
timestamp = Time.at(iss_data["timestamp"])
success = iss_data["message"]

if success == 'success'
  puts "#{timestamp}: The ISS is currently at latitude #{latitude} and longitude #{longitude}."
else
  puts '"Ground control to Major Tom?" Unable to retrieve ISS data at this time.'
end