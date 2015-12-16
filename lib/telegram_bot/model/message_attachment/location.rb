module TelegramBot
  # This object represents a point on the map.
  class Model::MessageAttachment::Location < Model::MessageAttachment::Base
    attr_accessor :longitude, :latitude

    validates :longitude, :latitude, presence: true
    validates :longitude, :latitude, numericality: true
    
  end
end
