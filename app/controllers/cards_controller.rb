get '/cards/:id' do
	@card = Round.find(session[:round_id]).next_card(session[:cycle])
	erb :'cards/show'
end

get '/cards' do
	if Guess.where(round_id: session[:round_id], cycle: session[:cycle] - 1, correct: false).length == 0
		redirect "/rounds/#{session[:round_id}"
	else
		#figure this out
	end
end
