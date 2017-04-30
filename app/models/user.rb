class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :full_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  belongs_to :game
  has_many :subscriptions, foreign_key: :subscriber_id
  has_many :subscribed_streamers, through: :subscriptions, source: :streamer
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
  
end
