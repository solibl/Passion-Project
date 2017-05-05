helpers do
	def streamer_bio(streamer)
		url = URI("https://api.twitch.tv/kraken/users/#{streamer}?client_id=#{ENV['TWITCH_API_KEY']}")

		http = Net::HTTP.new(url.host, url.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE

		request = Net::HTTP::Get.new(url)
		request["cache-control"] = 'no-cache'
		request["postman-token"] = '6c966637-f4c1-b581-0dc4-884a0f36b69b'

		response = http.request(request)
		results = response.read_body
	end
	
	def search_by_game(game)
		url = URI("https://api.twitch.tv/kraken/streams/?game=#{game}&client_id=#{ENV['TWITCH_API_KEY']}&limit=15")

		http = Net::HTTP.new(url.host, url.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE

		request = Net::HTTP::Get.new(url)
		request["cache-control"] = 'no-cache'
		request["postman-token"] = '113e2541-cbdf-a2c5-7174-27795bc8a426'

		response = http.request(request)
		results = response.read_body

	end
end