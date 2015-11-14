get '/cards/:id' do
	session[:deck_index] += 1

	@deck = Deck.find(session[:deck_id])

	if index < @deck.cards.length
		@card = @deck.cards[@index]
	else
		redirect("/decks/#{params[:id]}/results")
	end

	if session[:cycle] == 1
		cards = @deck.cards # => array of cards
	else
		cards = Guess.where(round_id: round_id, correct: false, cycle: cycle - 1).map(&:card)
	end

	cards.shuffle!

	while @card = cards.pop
		if Guess.exists?(round_id: session[:round_id] card_id: @card.id, cycle: session[:cycle])
		else
			break
		end
	end

	if cards.length == 0
		session[:cycle] += 1
		redirect('/cards')
	end

	erb :'cards/show'
end

get '/cards' do

	if Guess.where(round_id: session[:round_id], cycle: session[:cycle] - 1, correct: false).length == 0
	redirect "/rounds/#{session[:round_id}"
else
	#figure this out
	end

end


get '/cards/:id/results'