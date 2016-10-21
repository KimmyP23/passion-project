get '/' do
  @api_key = ENV['YOUR_API_KEY']
	erb :index 
end