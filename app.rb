require 'sinatra'
require 'sinatra/activerecord'
require_relative './models/Attendee'
require_relative './models/HappyHourEvent'

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

get '/attendee/:id/edit' do
  @current_attendee = Attendee.find(params[:id])
  erb :edit
end

put '/attendee/:id' do
  @current_attendee = Attendee.find(params[:id])
  @current_attendee.update(first_name: params[:first_name], last_name: params[:last_name], age: params[:age], likes_beer: params[:likes_beer])
  redirect "/"
end

delete '/attendee/:id' do
  Attendee.destroy(params[:id])
  redirect '/'
end
