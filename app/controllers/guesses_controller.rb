get '/guesses/:id' do
  @guess = Guess.find(params[:id])
  @card = @guess.card
  erb :"guesses/show"

end


post '/guesses' do
  round = Round.find(session[:round_id])
  card = Card.find(session[:card_id])

  guess = Guess.new(round: round, card: card, cycle: session[:cycle])
  guess.correct = params[:response] == card.answer ? true : false

  guess.save
  session[:guess_id] = guess.id

  redirect "/guesses/#{guess.id}"

end
