class CreateSubscriptions < ActiveRecord::Migration
	def change
		create_table :subscriptions do |t|
			t.integer :streamer_id
			t.references :subscriber, null: false

			t.timestamps
		end
	end
end
