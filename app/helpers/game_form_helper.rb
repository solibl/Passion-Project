module GameFormHelper
  def select_streamers(streams)
    users = []
    streams.each do |stream|
      users << User.find_by(username: stream["channel"]["display_name"])
    end
    users
  end

  def build_game_selection(game_name)
    selection = ""

    Game.all.each do |game|
      if game_name == game.game_name
        selection += "<option selected='selected' value='#{game.game_name}'>#{game.game_name}</option>"
      else
        selection += "<option value='#{game.game_name}'>#{game.game_name}</option>"
      end
    end
    selection
  end
end

helpers GameFormHelper