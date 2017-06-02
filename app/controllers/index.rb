get '/' do
	if (User.all.count != 0)
	total_users = User.all.count
	@user = User.find(rand(1..total_users))
	end
	erb :index
end