require_relative 'config/application'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

get '/' do
  'Hey everyone!'
end

get '/restaurants' do
  @restaurants = Restaurant.all

  erb :index
end

get '/restaurants/:id' do
  id = params[:id]
  # Get the restaurant instance with the given ID (from DB)
  @restaurant = Restaurant.find(id)
  # render the restaurant details (ERB / View)
  erb :show
end
