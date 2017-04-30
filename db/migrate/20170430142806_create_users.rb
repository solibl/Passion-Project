class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :username, :full_name, :email, :password_hash, null: false
  		t.references :game

  		t.timestamps
  	end
  end
end
