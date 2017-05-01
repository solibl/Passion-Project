get '/users/new' do
	erb :'/users/new'
end

get '/users/login' do
	
end

post '/users' do
	@user = User.new(params[:user])
	if @user.save
		redirect "/user/#{@user.id}"
	else
		@errors = @user.errors.full_messages
		erb :'/users/new'
	end
end
