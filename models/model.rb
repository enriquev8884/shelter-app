require 'petfinder'
# https://github.com/ehutzelman/petfinder

Petfinder.configure do |config|
  config.api_key = "472d66ad2bc7f83e735c4552db634039"
  config.api_secret = "0a50c24a7ed5982100eed6d203ad37b1"
end
petfinder = Petfinder::Client.new


pets = petfinder.find_pets('dog', '11224')
puts pets.count
puts pets.first.name