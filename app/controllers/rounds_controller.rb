get '/rounds/:id' do
  #CD: TLDR;

  round = Round.find(params[:id])
  @title = round.deck.name
  #ZM: @correct = round.guesses.where(correct: true, cycle: 1)
  #ZM: @correct = round.number_correct_guesses
  @correct_guesses = Guess.where(round_id: round.id, correct: true, cycle: 1).count
  @total_guesses = Guess.where(round_id: round.id).count

  #ZM: then you assign two variables to the round object...
  round.first_round_correct = @correct_guesses
  round.total_guesses = @total_guesses

  #ZM: Then you SAVEEEEE IT IN A GET REQUEST :(((((
  round.save

  #ZM: Then there is a session obj that is always 0... ho hummm
	session[:deck_id] = 0
	erb :'decks/result'
end

get "/rounds/:id/next-cycle" do
  @message = "You finished all cards, but let\'s repeat the wrong ones."
  erb :"rounds/cycle_result"
end


