module TelegramBot
  # This object represents a point on the map.
  class Model::Attachment::Location < Model::Attachment::Base
    attr_accessor :longitude, :latitude

    validates :longitude, :latitude, presence: true
    validates :longitude, :latitude, numericality: true
    
  end
end
