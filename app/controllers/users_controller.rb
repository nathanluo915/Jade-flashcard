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
    session[:username] = user.username
    redirect '/'
  else
    @errors = user.errors.full_message
    erb :"users/new"
  end
end

get '/users/:id' do
  if session[:user_id]
    @user = User.find(params[:id])
    @decks = @user.decks
    @results = {}

    @decks.each do |deck|
      # binding.pry
      @results[deck.name]=[]
      deck.rounds.each do |round|
        hsh={}
        hsh[:first_guess]= round.first_round_correct
        hsh[:total_guesses]= round.total_guesses
        hsh[:update_time] = round.updated_at.to_date
        @results[deck.name] << hsh
      end

    end

    erb :"users/show"
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
    user.update(name: params[:name], email: params[:email], password: params[:password])
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
