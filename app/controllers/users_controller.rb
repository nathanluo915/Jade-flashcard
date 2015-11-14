get '/users/new' do
  erb :"users/new"
end

get '/users' do
  erb :"users/login"
end

post '/users' do
  user = User.new(params[:post])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = user.errors.full_message
    erb :"users/new"
  end
end

get '/users/:id' do
  if session[:user_id]
    @user = User.find(params[:id])
    @decks = @users.decks
    # Iterate over @decks in erb file. In the table for first guess
  else
    # Need a 404 page
    erb :'404'
  end
end

get '/users/:id/edit' do
  if session[:user_id] ==  params[:id]
    @user = User.find(params[:id])
    erb :'users/edit'
  else
    erb :'404'
  end
end

put '/users/:id' do
  if session[:user_id] == params[:id]
    user = User.find(params[:id])
    user.update(name: params[:name], email: params[:email], password_hash: params[:password_hash])
  else
    erb :'404'
  end

end


delete '/users/:id' do
  if session[:user_id] == params[:id]
    user = User.find(params[:id])
    user.destroy
    redirect '/'
  else
    erb :'404'
  end
end
