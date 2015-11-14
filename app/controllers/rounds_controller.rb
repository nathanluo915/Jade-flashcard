get '/rounds/:id' do
  @round = Round.find(params[:id])
	session[:deck_id] = 0

	erb :'decks/results'
end

get "/rounds/:id/next-cycle" do
  @message = "You finished all cards, but let\'s repeat the wrong ones."
  erb :"rounds/cycle_result"
end
