# https://github.com/ehutzelman/petfinder
require 'petfinder'
  Petfinder.configure do |config|
  config.api_key = "472d66ad2bc7f83e735c4552db634039"
  config.api_secret = "0a50c24a7ed5982100eed6d203ad37b1"
  @@petfinder = Petfinder::Client.new
  end
class Pet_finder
  attr_reader:user_animal, :user_zip, :rick
  def initialize(user_animal, user_zip)
    @rick = []
    pets = @@petfinder.find_pets(user_animal, user_zip)
    @rick << pets.name
  end
end


