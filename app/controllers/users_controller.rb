get '/users/new/?' do
   erb :'/users/_new.html', layout: !request.xhr?
end

get '/users/:id/?' do
   @user = User.find(params[:id])
   
   if current_user == @user
      erb :'users/show'
   else
      redirect "/"
   end
end

post '/users/?' do   
   if params[:password_confirmation] == params[:user][:password]
      @user = User.new(params[:user])

      if @user.save
         session[:id] = @user.id
         redirect '/'
      else
         @errors = @user.errors.full_messages
         erb :'/users/_new.html', layout: !request.xhr?
      end
   else
      @errors = "Passwords do not match!"
      erb :'/users/_new.html', layout: !request.xhr?
   end
end



