require 'google_maps_service'
require 'pp'
# Setup API keys
@@gmaps = GoogleMapsService::Client.new(key: 'AIzaSyBH9tBC1IeaPLSUGKXuVhYgBAYJrr2r8LE')
# https://maps.googleapis.com/maps/api/place/textsearch/json?query=mightymutts&key=AIzaSyBH9tBC1IeaPLSUGKXuVhYgBAYJrr2r8LE

# Setup client IDs
# use free google key
@@gmaps = GoogleMapsService::Client.new(
    #created web client 1
    client_id: '689071292642-vrt9qnp61vp1s89e9c97k7hlr0epanb0.apps.googleusercontent.com',
    client_secret: 'Ql3l6FqTF69HptZ--cV1kaKT'
)

# More complex setup
@@gmaps = GoogleMapsService::Client.new(
    key: 'AIzaSyD64Rqhz32vjWAMqSWf_fZ538eTlmOF2VM', #free google maps key
    retry_timeout: 20,      # Timeout for retrying failed request
    queries_per_second: 10  # Limit total request per second
)
class ShelterDirection
    attr_reader :address, :distance_html, :steps
    def initialize(street,city,state,zipcode)
        address_array = [street,city,state,zipcode,"USA"]
        @address= address_array.join(", ")
        route
    end
    def route
        routes = @@gmaps.directions(
        @address, #user address
        '2400 Amphitheatre Parkway, Mountain View, CA 94043, USA', #shelter address
         mode: 'driving', # takes in m=user transportation mode "replace driving with param" <-- DAYSI DO THIS INSIDE OF RESULTS
        alternatives: false)
        @distance_html=[]
        routes[0][:legs][0][:steps].each do |direction_hash|
    
        @distance_html << direction_hash[:html_instructions]
        @steps = @distance_html.length
        end
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