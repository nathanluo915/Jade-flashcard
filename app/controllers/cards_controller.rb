get '/cards/:id' do
	round = Round.find(session[:round_id])
  @card = round.next_card(session[:cycle])

  if @card
    session[:card_id] = @card.id
	  erb :'cards/show'
  else

    session[:cycle] += 1
    
    if  round.next_card(session[:cycle]).nil?
      redirect "/rounds/#{round.id}"
    else
      redirect "/rounds/#{round.id}/next-cycle"
    end
  end
end

get '/cards' do
	if Guess.where(round_id: session[:round_id], cycle: session[:cycle] - 1, correct: false).length == 0
		redirect "/rounds/#{session[:round_id]}"
	else
		#figure this out
	end
end
