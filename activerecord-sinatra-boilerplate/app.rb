require_relative 'config/application'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

get '/' do
  'Hey everyone!'
end

get '/restaurants' do
  'TODO: list all the restaurants in the DB'
end
