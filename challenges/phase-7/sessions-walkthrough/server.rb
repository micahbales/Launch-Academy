require 'sinatra'
require 'pry'

use Rack::Session::Cookie, {
  secret: "hello_i_am_a_frog",
  expire_after: 86400
}

get '/index' do
  if session[:visit_count].nil?
    session[:visit_count] = 1
  else
    session[:visit_count] += 1
  end
  erb :index
end

post '/create' do
  session[:username] = params[:username]
  session[:code_word] = params[:code_word]
  session[:message] = params[:message]
  redirect '/index'
end

post '/codeword' do
  codeword = session[:code_word]
  entered_codeword = params[:entered_code_word]
  if codeword == entered_codeword
    session[:show_message] = 'true'
    redirect '/message'
  else
    redirect '/index'
  end
end

get '/message' do
  if session[:show_message] == 'true'
    @message = session[:message]
    session[:show_message] = 'false'
    erb :message
  else
    redirect '/index'
  end
end

get '/reset' do
  session.clear
  redirect '/index'
end
