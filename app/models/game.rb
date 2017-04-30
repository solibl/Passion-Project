class Game < ActiveRecord::Base
  validates :game_name, presence: true
  
  has_many :users
end
