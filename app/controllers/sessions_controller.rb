get "/session" do
  erb :"users/login"
end

post "/session/new" do
  user = User.find_by(email: params[:email])

  if user && user.password_hash == params[:password_hash]
    session[:user_id] = user.id
    session[:username] = user.username
    p session
    redirect '/'
  else
    puts session
    erb :"users/login"
  end
end

delete "/session" do
  session.clear
  redirect "/"
end
