module FantasticRobot
  # This object represents an audio file to be treated as music by the Telegram clients.
  class Model::Attachment::Audio < Model::Attachment::Base

    attr_accessor :file_id, :file_size, :duration, :performer, :title, :mime_type

    validates :file_id, :duration, presence: true
    validates :duration, numericality: true
    validates :file_size, numericality: true, unless: -> { file_size.blank? }

  end
end
