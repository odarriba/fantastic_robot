module TelegramBot
  # This object represents a point on the map.
  class MessageElement::Location < MessageElement::Base
    attribute :longitude, Float
    attribute :latitude,  Float
  end
end
