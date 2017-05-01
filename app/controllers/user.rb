get '/users/new' do
	erb :'/users/new'
end

get '/users/login' do
	erb :'users/login'
end

get '/users/logout' do
	logout
	redirect '/'
end

get '/users/:id' do
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
	login(@user)
	redirect "/users/#{@user.id}"
end