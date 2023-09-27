require "sinatra"
require "sinatra/reloader"

get("/") do

  erb(:square)
end

get("/square/new") do
  @number = 3
  result = @number * @number

  "<p>The answer is #{result}</p>"

  erb(:square)
end

get("/square/results") do
 
  erb(:square_results)
end
