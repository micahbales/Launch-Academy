require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

require_relative 'models/contact'
also_reload 'models/contact'

set :bind, '0.0.0.0'  # bind to all interfaces

get '/' do
  @contacts = Contact.all
  erb :index
end

get '/contacts' do
  current_page = params[:page].to_i
  current_page = 1 unless current_page > 0
  current_offset = (current_page - 1) * 10

  @contacts = Contact.limit(10).offset(current_offset || 0)

  if current_page > 1
    @last_page = current_page - 1
  else
    @last_page = nil
  end
  unless @contacts.length == 10
    @next_page = nil
  else
    @next_page = current_page + 1
  end
  erb :'contacts/index'
end

get '/contacts/:id' do
 @contact = Contact.find(params[:id])
 erb :'contacts/show'
end

post '/search' do
all_contacts = Contact.all
first_name = params[:first_name]
last_name = params[:last_name]
@contacts = all_contacts.where("first_name = ? OR last_name = ?", first_name, last_name)
erb :'contacts/index'

end

get '/add' do
  erb :add
end

post '/add' do
  first_name = params[:first_name]
  last_name = params[:last_name]
  phone_number = params[:phone_number]
  Contact.create(first_name: first_name, last_name: last_name, phone_number: phone_number)
  @new_person = Contact.all.last.name
  erb :add
end
