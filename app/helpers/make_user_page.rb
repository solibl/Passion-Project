helpers do
	def create_user_pages(stream_list)
		stream_list.each do |stream|
			current_game = Game.find_by(game_name: stream["game"])
			if User.find_by(username: stream["channel"]["display_name"]) == nil
				User.create(username: stream["channel"]["display_name"], full_name: stream["channel"]["name"], logo: stream["channel"]["logo"], email: Faker::Internet.safe_email, password: "1", game_id: current_game.id)
			end
		end
	end
end