get '/' do
	total_users = User.all.count
	@user = User.find(rand(1..total_users))
	erb :index
end