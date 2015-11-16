get "/session" do
  erb :"users/login"
end

post "/session/new" do
  user = User.find_by(email: params[:email])

  if user && user.password == params[:password]
    session[:user_id] = user.id
    session[:username] = user.username
    #ZM: don't p in your code
    p session
    redirect '/'
  else
    #ZM: don't puts in your code either
    puts session
    erb :"users/login"
  end
end

delete "/session" do
  session.clear
  redirect "/"
end
