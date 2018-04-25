require 'sinatra'
require 'sinatra/activerecord'
require_relative './models/Attendee'

set :database, {adapter: 'postgresql', database: 'happyhour'}

get '/' do
  @attendees = Attendee.all
  erb :index
end

get '/attendee/new' do
  erb :new
end

post '/attendee/new' do
  @new_attendee = Attendee.create(first_name: params[:first_name], last_name: params[:last_name], age: params[:age], likes_beer: params[:likes_beer])
  redirect "/"
end
