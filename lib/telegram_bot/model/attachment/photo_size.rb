module TelegramBot
  # This object represents one size of a photo or a file / sticker thumbnail.
  class Model::Attachment::PhotoSize < Model::Attachment::Base

    attr_accessor :file_id, :file_size, :width, :height

    validates :file_id, :width, :height, presence: true
    validates :width, :height, numericality: true
    validates :file_size, numericality: true, unless: 'file_size.blank?'
    
  end
end
