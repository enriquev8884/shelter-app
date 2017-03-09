require 'dotenv/load'
require 'bundler'
Bundler.require

require_relative 'models/model.rb', 'models/google_maps.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/result' do
    user_zip = params[:zipcode]
    user_animal = params[:animal]
    @user_choices = Pet_finder.new(user_animal,user_zip)
    erb :results
  end
  
  post '/user_address' do
    street = params[:street]
    city = params[:city]
    state = params[:state]
    zipcode = params[:zipcode]
    @user_choices = ShelterDirection.new(street,city,state,zipcode)
    erb :result
  end
end
