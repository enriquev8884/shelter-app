require 'google_maps_service'
require 'pp'
# Setup API keys
gmaps = GoogleMapsService::Client.new(key: 'AIzaSyBH9tBC1IeaPLSUGKXuVhYgBAYJrr2r8LE')

# Setup client IDs
# use free google key
gmaps = GoogleMapsService::Client.new(
    #created web client 1
    client_id: '689071292642-vrt9qnp61vp1s89e9c97k7hlr0epanb0.apps.googleusercontent.com',
    client_secret: 'Ql3l6FqTF69HptZ--cV1kaKT'
)

# More complex setup
gmaps = GoogleMapsService::Client.new(
    key: 'AIzaSyD64Rqhz32vjWAMqSWf_fZ538eTlmOF2VM', #free google maps key
    retry_timeout: 20,      # Timeout for retrying failed request
    queries_per_second: 10  # Limit total request per second
)

routes = gmaps.directions(
    '1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA',
    '2400 Amphitheatre Parkway, Mountain View, CA 94043, USA',
    mode: 'walking',
    alternatives: false)
@distance_html=[]
routes[0][:legs][0][:steps].each do |direction_hash|
    
    @distance_html << direction_hash[:html_instructions]
end
pp @distance_html











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