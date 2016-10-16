get '/' do
  @api_key = ENV['YOUR_API_KEY']
	erb :index, layout: !request.xhr?
end