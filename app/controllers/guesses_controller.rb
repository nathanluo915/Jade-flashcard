get '/guesses/:id' do
  @guess = Guess.find(params[:id])
  @card = @guess.card

  erb :"guesses/show"
end


post '/guesses' do
  round = Round.find(session[:round_id])
  card = Card.find(session[:card_id])

  guess = Guess.new(round: round, card: card, cycle: session[:cycle])

  #ZM: Choosing if the response is correct is the responsibility of the Card model
  # not the controller.  

  # guess.correct = card.is_correct?( params[:resonse] )
  guess.correct = params[:response] == card.answer ? true : false
  guess.save
  # binding.pry

  redirect "/guesses/#{guess.id}"

end
