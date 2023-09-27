require "sinatra"
require "sinatra/reloader"

get("/") do

  erb(:square)
end

#Square form and results
get("/square/new") do
  
  erb(:square)
end

get("/square/results") do
  @the_num = params.fetch("user_number").to_f
  
  @the_result = @the_num ** 2

  erb(:square_results)
end

#Square root form and results
get("/square_root/new") do
  
  erb(:square_root)
end

get("/square_root/results") do
  @the_num = params.fetch("user_number").to_f
  
  @the_result = @the_num ** 0.5

  
  erb(:square_root_results)
end

#Payment with form
get("/payment/new") do
  
  erb(:payment)
end

get("/payment/results") do
  @apr = params.fetch("apr").to_f
  @years = params.fetch("years").to_f
  @principal = params.fetch("principal").to_f

  monthly_apr = (@apr / 100) / 12.00

  n = @years * 12
 
  numerator = @principal * monthly_apr * (1 + monthly_apr)**n
  denominator = (1 + monthly_apr)**n - 1
  @payment = (numerator / denominator).to_f
  @monthly_payment = "$#{@payment}"
 
  @principal_currency = "$#{@principal}"
  
  erb(:payment_results)
end

#Random
get("/random/new") do
  
  erb(:random)
end

get("/random/results") do
  @min = params.fetch("user_number_min").to_f
  @max = params.fetch("user_number_max").to_f
  @random = rand(@min..@max).to_f
  
  erb(:random_results)
end
