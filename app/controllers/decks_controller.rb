post '/decks' do
	Deck.create(params[:deck])
	redirect('/')
end


get '/decks/:id' do
	session[:deck_index] = 0
	session[:deck_id] = params[:id]
	round = Round.create(user_id: session[:user_id], deck_id: session[:deck_id])
	session[:round_id] = round.id

	erb :'decks/show'
end

get '/decks/:id/results'
	session[:deck_index] = 0
	session[:deck_id] = 0

	@correct_answers = Round.
	erb :'decks/results'
end

# if response == answer
# 	@card = Deck.find(params[:id]).cards[session[:deck_index] + 1]
# 	erb :"cards/show"
# else
# 	@errors = message
# 	@card = 