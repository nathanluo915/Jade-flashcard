get '/rounds/:id' do
	session[:deck_index] = 0
	session[:deck_id] = 0

	@correct_answers = Round.
	erb :'decks/results'
end