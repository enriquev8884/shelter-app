# https://github.com/ehutzelman/petfinder
require 'petfinder'
  Petfinder.configure do |config|
    config.api_key = "472d66ad2bc7f83e735c4552db634039"
    config.api_secret = "0a50c24a7ed5982100eed6d203ad37b1"
  end
  @@petfinder = Petfinder::Client.new
  
class Pet_finder
  
  attr_reader:user_animal, :user_zip, :pets, :pets_name, :pets_shelter
  
  def initialize(user_animal, user_zip)
    @pets = @@petfinder.find_pets(user_animal, user_zip)
    each_pet
  end
  
  def each_pet
    @pets_name = []
    @pets_shelter = []
      i = -1
      x = -1
    @number_of_animals = @pets.count
    @number_of_animals.times do
      i += 1
      @pets_name << @pets[i].name
    end
    @number_of_animals.times do
      x += 1
      name = @pets[x].shelter_id
      shelter = @@petfinder.shelter(name)
      @pets_shelter << shelter.name
    end
    def shelter_list
      shelters << @pets_shelter
    end
    
  end
  
end


