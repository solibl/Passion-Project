get '/games/:id' do
	@game_search = Game.find(params[:id])
	@users_playing = @game_search.users
	erb :'/games/show'
end
