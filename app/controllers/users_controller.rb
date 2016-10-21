get '/users/?' do
   redirect "/"
end

get '/users/new/?' do
   erb :'/users/_new.html', layout: !request.xhr?
end

get '/users/:id/?' do
   @user = User.find(params[:id])
   if current_user == @user
      redirect "/users/#{@user.id}"
   else
      redirect "/"
   end
end


post '/users/?' do   
   if params[:password_confirmation] == params[:user][:password]
      @user = User.new(params[:user])

      if @user.save
         session[:id] = @user.id
         erb :'/headers/_header_links.html', layout: !request.xhr?
      else
         @errors = @user.errors.full_messages
         erb :'/users/_new.html', layout: !request.xhr?
      end
   else
      @errors = "Passwords do not match!"
      erb :'/users/_new.html', layout: !request.xhr?
   end
end



