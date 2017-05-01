put '/subscriptions' do
	@streamer = User.find(params["streamer"])
	@current_user = User.find(session[:id])
	Subscription.create(streamer_id: @streamer.id, subscriber_id: @current_user.id)
	redirect "/users/#{@streamer.id}"
end

delete '/subscriptions' do
	@streamer = User.find(params["streamer"])
	@current_user = User.find(session[:id])
	Subscription.where(streamer_id: @streamer.id, subscriber_id: @current_user).destroy_all
	redirect "/users/#{@streamer.id}"
end