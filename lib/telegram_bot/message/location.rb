module TelegramBot
  # This object represents a point on the map.
  class Message::Location < Message::Base
    attribute :longitude, Float
    attribute :latitude,  Float
  end
end
