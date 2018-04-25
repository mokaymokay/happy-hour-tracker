require 'sinatra'
require 'sinatra/activerecord'
require_relative './models/Attendee'
require_relative './models/HappyHourEvent'

set :database, {adapter: 'postgresql', database: 'happyhour'}

get '/' do
  @events = HappyHourEvent.all
  erb :'events/index'
end

get '/events/new' do
  @attendees = Attendee.all
  erb :'events/new'
end

post '/events/new' do
  @event = HappyHourEvent.create(name: params[:name], location: params[:location], capacity: params[:capacity])
  redirect "/events/#{@event.id}"
end

put '/attendees/:id' do
  @current_attendee = Attendee.find(params[:id])
  @current_attendee.update(first_name: params[:first_name], last_name: params[:last_name], age: params[:age], likes_beer: params[:likes_beer])
  redirect "/attendees"
end

get '/attendees' do
  @attendees = Attendee.all
  erb :'attendees/index'
end

get '/events/:id' do
  @event = HappyHourEvent.find(params[:id])
  @attendees = Attendee.where(happy_hour_event_id: params[:id])
  erb :'events/show'
end

get '/attendees/new' do
  erb :'attendees/new'
end

post '/attendees/new' do
  @new_attendee = Attendee.create(first_name: params[:first_name], last_name: params[:last_name], age: params[:age], likes_beer: params[:likes_beer], happy_hour_event_id: params[:event_id])
  redirect "/attendees"
end

get '/attendees/:id/edit' do
  @current_attendee = Attendee.find(params[:id])
  erb :'attendees/edit'
end

put '/attendees/:id' do
  @current_attendee = Attendee.find(params[:id])
  @current_attendee.update(first_name: params[:first_name], last_name: params[:last_name], age: params[:age], likes_beer: params[:likes_beer], happy_hour_event_id: params[:event_id])
  redirect "/attendees"
end

delete '/attendees/:id' do
  Attendee.destroy(params[:id])
  redirect '/attendees'
end
