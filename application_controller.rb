require 'dotenv/load'
require 'bundler'
Bundler.require

require_relative 'models/model.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/result' do
    user_zip = params[:zipcode]
    user_animal = params[:animal]
    @user_choices = Playlist.new(user_zip,user_animal)
    
    erb :result
  end
  
end
