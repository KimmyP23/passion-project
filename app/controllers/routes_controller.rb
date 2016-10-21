
# Display new route form
get '/routes/new' do
  if logged_in? 
      erb :'routes/new'
  else
    redirect '/'
  end
end

#Save Route to User 
post '/routes' do 
  @route = Route.new(params[:route])
  @route.user_id = current_user.id
  if @route.save
    redirect "/"
  else
    erb :'routes/new' 
  end
end

# Select a particular route to display
get '/routes/:id' do 
  @route = Route.find(params[:id])
  if request.xhr?
    erb :"/partials/_routeshow", layout: false
  else
    erb :'routes/show'
  end
end


delete '/routes/:id' do
  unwanted_route = Route.find(params[:id])
  unwanted_route.delete
  redirect '/'
end
  
