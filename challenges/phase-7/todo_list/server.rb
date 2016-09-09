require "sinatra"

set :public_folder, File.join(File.dirname(__FILE__), "public")

get "/hello" do
  "<p>Hello, world! The current time is #{Time.now}.</p>"
end

get "/tasks" do
  @tasks = File.readlines("tasks.txt")
  erb :index
end

get "/tasks/:task_name" do
  @task_name = params[:task_name]
  erb :show
end

post "/tasks" do

  task = params["task_name"]

  # Open the "tasks.txt" file and append the task
  File.open("tasks.txt", "a") do |file|
    file.puts(task)
  end

  redirect "/tasks"
end
