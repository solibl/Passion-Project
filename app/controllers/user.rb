get '/users/new' do
	erb :'/users/new'
end

get '/users/login' do
	erb :'/users/login'
end

get '/users/logout' do
	logout
	redirect '/'
end

get '/users/:id' do
	@user = User.find(params[:id])
	@current_user = User.find(session[:id])
	erb :'/users/show'
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