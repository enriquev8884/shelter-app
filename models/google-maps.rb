require 'net/http'
require 'json'
require 'google_maps_service'
require 'pp'
require 'petfinder'

  url = 'https://maps.googleapis.com/maps/api/place/textsearch/json?query=mightymutts&key=AIzaSyBH9tBC1IeaPLSUGKXuVhYgBAYJrr2r8LE'
  uri = URI(url)
  response = Net::HTTP.get(uri)
  shelter_info = JSON.parse(response)
  shelter_address = shelter_info["results"][0]["formatted_address"]
  add_fix = shelter_address.split(",")
  add_fix.delete_at(3)
  add_fix.push(" USA")
  add_fix.join(", ")
  @@shelter_address = add_fix.join(", ")
  
  
  
# Setup API keys
@@gmaps = GoogleMapsService::Client.new(key: ENV["GOOGLE_KEY"])
# https://maps.googleapis.com/maps/api/place/textsearch/json?query=mightymutts&key=AIzaSyBH9tBC1IeaPLSUGKXuVhYgBAYJrr2r8LE

# Setup client IDs
# use free google key
@@gmaps = GoogleMapsService::Client.new(
    #created web client 1
    client_id: ENV["G_CLIENT_ID"],
    client_secret: ENV["G_CLIENT_SECRET"]
)

# More complex setup
@@gmaps = GoogleMapsService::Client.new(
    key: ENV["G_FREE_KEY"], #free google maps key
    retry_timeout: 20,      # Timeout for retrying failed request
    queries_per_second: 10  # Limit total request per second
)
class ShelterDirection
    attr_reader :address, :distance_html, :steps, :trans_method
    def initialize(street,city,state,zipcode,trans_method)
        @trans_method = trans_method
        address_array = [street,city,state,zipcode,"USA"]
        @address= address_array.join(", ")
        route
    end
    def route
        routes = @@gmaps.directions(
        @address, #user address
        @@shelter_address, #shelter address
         mode:'driving', # takes in m=user transportation mode "replace driving with param"
        alternatives: false)
        
        @distance_html=[]
        routes[0][:legs][0][:steps].each do |direction_hash|
    
        @distance_html << direction_hash[:html_instructions]
        @steps = @distance_html.length
        end
        # @shelter_address = 
    end
end

# address = ShelterDirection.new("430 E 9th St","New York", "NY", "10009")
# pp address










# installs it globally
# require 'google_maps_service'

# # Setup global parameters
# GoogleMapsService.configure do |config|
#   config.key = 'Add your key here'
#   config.retry_timeout = 20
#   config.queries_per_second = 10
# end

# # Initialize client using global parameters
# gmaps = GoogleMapsService::Client.new