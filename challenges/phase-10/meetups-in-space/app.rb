require 'sinatra'
require_relative 'config/application'
require 'pry'

set :bind, '0.0.0.0'  # bind to all interfaces

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

def clear_sessions
  session[:title] = nil
  session[:location] = nil
  session[:description] = nil
  @title = nil
  @location = nil
  @description = nil
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  clear_sessions
  @meetups = Meetup.order(:title)

  erb :'meetups/index'
end

get '/meetups/new' do
  @title = session[:title]
  @location = session[:location]
  @description = session[:description]

  erb :'meetups/new'
end

get '/meetups/:id' do
  @meetup = Meetup.find(params[:id])

  erb :'meetups/show'
end

post '/meetups/new' do

  session[:title] = params[:title]
  session[:location] = params[:location]
  session[:description] = params[:description]

  new_meetup = Meetup.new(title: session[:title], location: session[:location], description: session[:description])

  if new_meetup.save
    flash[:notice] = "Congratulations! You've created a new meetup!"
    clear_sessions
    redirect "/meetups/#{new_meetup.id}"
  else
    flash[:notice] = "Uh-oh! Please fill in all fields to create your meetup!"
    redirect :'meetups/new'
  end
end
