require 'sinatra'
require 'sinatra/activerecord'
require_relative './models/Attendee'

set :database, {adapter: 'postgresql', database: 'happyhour'}

get '/' do
  @attendees = Attendee.all
  erb :index
end
