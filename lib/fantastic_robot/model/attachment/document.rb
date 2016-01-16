module FantasticRobot
  # This object represents a general file (as opposed to photos, voice messages and audio files).
  class Model::Attachment::Document < Model::Attachment::Base

    attr_accessor :file_id, :file_size, :thumb, :file_name, :mime_type

    validates :file_id, presence: true
    validates :file_size, numericality: true, unless: 'file_size.blank?'

    # Field conversions of this model
    FIELD_CONVERSIONS = {
      thumb: FantasticRobot::Model::Attachment::PhotoSize
    }
    
  end
end
