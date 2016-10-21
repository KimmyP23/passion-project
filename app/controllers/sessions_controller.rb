
get '/sessions/login/?' do
   erb :'sessions/_login.html', layout: !request.xhr?
end

post '/sessions/login/?' do
   @user = User.find_by_username(params[:user][:email])
   if @user && @user.password == params[:user][:password]
      session[:id] = @user.id
      redirect '/'
   else
      @errors = "Email & Password not found"
      erb :'/sessions/_login.html', layout: !request.xhr?
   end
end

get '/logout' do
   session[:id] = nil
   redirect '/'
end