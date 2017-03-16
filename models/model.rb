# https://github.com/ehutzelman/petfinder
require 'petfinder'
  Petfinder.configure do |config|
    config.api_key = ENV["PET_KEY"]
    config.api_secret = ENV["PET_SECRET"]
  end
class Pet_finder
  
  attr_reader:user_animal, :user_zip, :pets, :pets_name, :pets_shelter, :trans_method
  
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



