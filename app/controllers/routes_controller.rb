# diplay all routes to users

get '/user/:user_id/routes' do 
  @user = User.find(params[:user_id])
  @routes = @user.routes
  erb :'routes/index'
end

# Display new route form
get '/user/:user_id/routes/new' do 
  @user = User.find(params[:user_id])
  erb :'routes/new'
end

#Save Route to User 
post '/user/:user_id/routes' do 
  @user = User.find(params[:user_id])
  @route = @user.routes.new(params[:route])
  if @route.save
    redirect "/user/#{@user.id}/routes"
  else
    erb :'routes/new' 
  end
end

# Select a particular route to display
get '/user/:user_id/routes/:id' do 
  @user = User.find(params[:user_id])
  @route = @user.routes.find(params[:id])
  erb :'routes/show'
end

# # Display form to edit
# get '/user/:user_id/routes/:id/edit' do
#   @user = User.find(params[:user_id])
#   @route = @user.routes.find(params[:id])
#   erb :'routes/edit'
# end

# # Update route
# put '/user/:user_id/routes/:id' do
#   @user = User.find(params[:user_id])
#   @route = @user.routes.find(params[:id])

#   if @route.update_attributes(params[:route])
#     redirect "/user/#{@user.id}/routes"
#   else 
#     erb :'routes/edit' #show edit routes view again(potentially displaying errors)
#   end
# end


# Delete user route
delete '/user/:user_id/routes/:id' do 
  @user = User.find(params[:user_id])
  @route = @user.routes.find(params[:id])
  @route.destroy
  redirect "/user/#{@user.id}/routes"
end


