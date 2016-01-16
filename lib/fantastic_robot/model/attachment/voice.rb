module FantasticRobot
  # This object represents a voice note.
  class Model::Attachment::Voice < Model::Attachment::Base

    attr_accessor :file_id, :file_size, :duration, :mime_type

    validates :file_id, :duration, presence: true
    validates :duration, numericality: true
    validates :file_size, numericality: true, unless: 'file_size.blank?'

  end
end
