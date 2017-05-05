get '/games/:id' do
	@game_search = Game.find(params[:id])

	streams = search_by_game(@game_search.game_name)
	streams = JSON.parse(streams)
	create_user_pages(streams["streams"])
	@users_playing = select_streamers(streams["streams"])
	# @users_playing = User.where(game_id: params[:id])
	if request.xhr?
		p @users_playing
	erb :'/games/show', layout: false
	else
	erb :'/games/show'
	end
end
