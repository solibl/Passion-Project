class CreateGames < ActiveRecord::Migration
  def change
  	create_table :games do |t|
  		t.string :game_name, null: false

  		t.timestamps
  	end
  end
end
