get '/rounds/:id' do
  round = Round.find(params[:id])
  @title = round.deck.name
  @correct_guesses = Guess.where(round_id: round.id, correct: true, cycle: 1).count
  @total_guesses = Guess.where(round_id: round.id).count
  round.first_round_correct = @correct_guesses
  round.total_guesses = @total_guesses
  round.save
	session[:deck_id] = 0
	erb :'decks/result'
end

get "/rounds/:id/next-cycle" do
  @message = "You finished all cards, but let\'s repeat the wrong ones."
  erb :"rounds/cycle_result"
end


