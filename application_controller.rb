require 'dotenv/load'
require 'bundler'
Bundler.require

require_relative 'models/model.rb'
require_relative 'models/google-maps.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :directions
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
    trans_method = params[:trans_method]
    @user_directions = ShelterDirection.new(street,city,state,zipcode,trans_method)
    erb :direction_results
  end
end
