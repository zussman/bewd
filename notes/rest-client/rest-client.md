#Ruby RestClient
##Ruby RestClient Video
The folks at General Assembly put together a helpful video on the Ruby [Rest-Client gem](https://github.com/rest-client/rest-client).The gem has really amazing documentation on github, so make sure you look through the README.rdoc if you get stuck, but these notes a good walk-through resource on how to use `rest-client`.

The video can be found [here](https://vimeo.com/67132957). You will need a password that I won't share because this is GA's proprietary video.

###Using rest-client
To get rest-client up and running you will need to require rest-client in your rb program. You should also require the `json` gem because you want to be able to convert the JSON string that you'll be pulling from the interwebs into a hash. 

That's really important because rest-client just gives you a long **string** of JSON. When you use the [`json` module](http://ruby-doc.org/stdlib-2.0/libdoc/json/rdoc/JSON.html) to turn it into a hash you will be able to run methods on the resultant hash that will allow you to work with the JSON really easily. You can access it's keys, iterate through it, etc.

##ISS JSON Program Example

```
# Require your json and rest-client gems/modules
require 'json'
require 'rest-client'

# Get the API json from the website
res_JSON = RestClient.get "http://api.open-notify.org/iss-now.json"

# Load the json to a hash
iss_data = JSON.load(res_JSON)

# Not required, but I've set the data equal to some simpler variables so that I can call them easily.
latitude = iss_data["iss_position"]["latitude"]
longitude = iss_data["iss_position"]["longitude"]
timestamp = Time.at(iss_data["timestamp"])
success = iss_data["message"]

# I've told this program to spit out the ISS's longitude and latitude if the data is pulled successfully.
if success == 'success'
  puts "#{timestamp}: The ISS is currently at latitude #{latitude} and longitude #{longitude}."
else
  puts '"Ground control to Major Tom?" Unable to retrieve ISS data at this time.'
end
```