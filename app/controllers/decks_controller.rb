post '/decks' do
	Deck.create(params[:deck])
	redirect('/')
end


get '/decks/:id' do
	@deck = Deck.find(params[:id])
	session[:deck_id] = params[:id]
	round = Round.create(user_id: session[:user_id], deck_id: session[:deck_id])
	session[:round_id] = round.id
	session[:cycle] = 1

	erb :'decks/show'
end


