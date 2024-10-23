require 'sinatra'
require 'sinatra/reloader' if development?

# Route to display the form on the homepage
get '/' do
  erb :index
end

# Route to process the roll, taking query parameters 'dice' and 'sides'
get '/process_roll' do
  # Fetch number of dice and sides from query string
  number_of_dice = params[:dice].to_i
  sides_per_die = params[:sides].to_i

  # Generate the dice rolls
  @rolls = (1..number_of_dice).map { rand(1..sides_per_die) }

  erb :result
end

