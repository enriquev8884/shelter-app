# https://github.com/ehutzelman/petfinder
  Petfinder.configure do |config|
  config.api_key = "472d66ad2bc7f83e735c4552db634039"
  config.api_secret = "0a50c24a7ed5982100eed6d203ad37b1"
  @@petfinder = Petfinder::Client.new
  end
class Pet_finder
  
  attr_reader:user_animal, :user_zip, :pets, :pets_names, :pet_shelter
  
  def initialize(user_animal, user_zip)
    # @pets_info = Hash.new([])
    @pets = @@petfinder.find_pets(user_animal, user_zip)
    each_pet
  end
  
  def each_pet
    @pets_names = []
    @pet_shelter = []
    i = -1
    # x = -1
    @number_of_animals = @pets.count
    @number_of_animals.times do
      i += 1
      @pets_names << @pets[i].name
      # @pet_shelter << @pets[i].shelterid
    end
    # number_of_animals.times do
    #   x += 1
    #   @pet_shelter << @pets[i].shelterid
    # end 
  end
  
end


