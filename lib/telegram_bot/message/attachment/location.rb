module TelegramBot
  # This object represents a point on the map.
  class Message::Attachment::Location < Message::Attachment::Base
    attribute :longitude, Float
    attribute :latitude,  Float
  end
end
