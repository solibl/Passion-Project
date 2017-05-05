get '/users/new' do
	if request.xhr?
		erb :'/users/_signup_form', layout: false
	else
		erb :'/users/new'
	end
end

get '/users/login' do
	if request.xhr?
		erb :'/users/_login_form', layout: false
	else
		erb :'/users/login'
	end
end

get '/users/logout' do
	logout
	redirect '/'
end

get '/users/search' do
	erb :'/users/search'
end

get '/users/:id' do
	@user = User.find(params[:id])
	if session[:id] != nil
		@current_user = User.find(session[:id])
		if @current_user.game_id == nil
			@current_game = Game.find(1)
			@game_selection = build_game_selection(@current_game.game_name)
		else
			@current_game = Game.find(@current_user.game_id)
			@game_selection = build_game_selection(@current_game.game_name)
		end
		erb :'/users/show'
	else 
		@errors = ["Must have an account to view users"]
		erb :'/users/new'
	end
end

get '/users/:id/subscribed' do
	@user = User.find(params[:id])
	if session[:id] == @user.id
		@subscribed_channels = @user.subscribed_streamers
		erb :'/users/subscribed'
	else
		@errors = ["You are not authorized to see that page"]
		erb :"index"
	end
end

post '/users' do
	@user = User.new(params[:user])
	if @user.save
		redirect "/users/login"
	else
		@errors = @user.errors.full_messages
		erb :'/users/new'
	end
end

post '/users/login' do
	@user = User.find_by(username: params["username"])
	if @user != nil
		login(@user)
		redirect "/users/#{@user.id}"
	else
		@errors = ["Invalid Username or Password"]
		erb :'/users/login'
	end
end

patch '/users/game' do
	@current_game_playing = Game.find_by(game_name: params["game"])
	@current_user = User.find(session[:id])
	@current_user.game_id = @current_game_playing.id
	@current_user.save
	redirect "/users/#{@current_user.id}"
end