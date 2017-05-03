get '/games/:id' do
	@game_search = Game.find(params[:id])
	@users_playing = @game_search.users
	if request.xhr?
	erb :'/games/show', layout: false
	else
	erb :'/games/show'
	end
end
