class Subscription < ActiveRecord::Base
  belongs_to :streamer, class_name: "User"
end
