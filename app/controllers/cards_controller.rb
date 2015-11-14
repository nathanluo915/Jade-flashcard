get '/cards/:id' do
	@deck = Deck.find(session[:deck_id])
	
 #see if we can move some logic to a model.
	if session[:cycle] == 1
		cards = @deck.cards # => array of cards
	else
		cards = Guess.where(round_id: round_id, correct: false, cycle: session[:cycle] - 1).map(&:card)
	end

	cards.shuffle!

	while @card = cards.pop
		if Guess.exists?(round_id: session[:round_id] card_id: @card.id, cycle: session[:cycle])
		else
			break
		end
	end
  #this won't work. when the last card of a cycle is registered it will be registered to the next cycle. Move this logic to after the last form is sent for the last card
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


get '/cards/:id/result'