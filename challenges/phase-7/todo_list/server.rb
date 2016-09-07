require "sinatra"

set :public_folder, File.join(File.dirname(__FILE__), "public")

get "/hello" do
  "<p>Hello, world! The current time is #{Time.now}.</p>"
end

get "/tasks" do
  @tasks = ["pay bills", "buy milk", "learn Ruby", "get root"]
  erb :index
end

get "/tasks/:task_name" do
  @task_name = params[:task_name]
  erb :show
end
