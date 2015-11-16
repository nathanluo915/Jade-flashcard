get '/users/new' do
  erb :"users/new"
end

#ZM: The restful convention is the index page for all users.
get '/users' do
  erb :"users/login"
end

post '/users' do
  user = User.new(params[:post])
  if user.save
    session[:user_id] = user.id

    #ZM: Why are you putting the id and username in session?
    session[:username] = user.username
    redirect '/'
  else
    @errors = user.errors.full_message
    erb :"users/new"
  end
end

#CD: This controller method is also doing to much work. 
get '/users/:id' do
  #ZM: Let's learn how to reduce nesting 
  erb :"404" unless session[:user_id]

  @user = User.find(params[:id])
  @decks = @user.decks

  #ZM: Code Smell is creating an object, iterating over things then shovling them in. 
  #This to me feels like there are enumerables that will solve this issue for us. 
  @results = {}

  @decks.each do |deck|
    @results[deck.name]=[]
    
    #ZM: Maybe make a method on the Round model called, get_stats
    deck.rounds.each do |round|
      hsh={}
      hsh[:first_guess]= round.first_round_correct
      hsh[:total_guesses]= round.total_guesses
      hsh[:update_time] = round.updated_at.to_date
      @results[deck.name] << hsh
    end
  end

  erb :"users/show"
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
