get '/games/:id' do
	@game_search = Game.find(params[:id])
	@users_playing = @game_search.users
    p "*" * 100
	p @users_playing
    p "*" * 100
	erb :'/games/show'
end
