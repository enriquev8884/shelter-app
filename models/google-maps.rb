require 'google_maps_service'

# Setup API keys
gmaps = GoogleMapsService::Client.new(key: 'AIzaSyBH9tBC1IeaPLSUGKXuVhYgBAYJrr2r8LE')

# Setup client IDs
gmaps = GoogleMapsService::Client.new(
    client_id: 'Add your client id here',
    client_secret: 'Add your client secret here'
)

# More complex setup
gmaps = GoogleMapsService::Client.new(
    key: 'Add your key here',
    retry_timeout: 20,      # Timeout for retrying failed request
    queries_per_second: 10  # Limit total request per second
)













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