
post '/guesses' do
  round = Round.find(session[:round_id])
  card = Card.find(session[:card_id])

  guess = Guess.new(round: round, card: card, cycle: session[:cycle])
  guess.correct = params[:answer] == card.answer ? true : false

  guess.save
  session[:guess_id] = guess.id

  redirect "/cards/#{session[:card_id]/result}"

end
