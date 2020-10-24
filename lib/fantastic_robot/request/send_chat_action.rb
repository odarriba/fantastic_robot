module FantasticRobot
  # This object represents a sendChatAction request
  class Request::SendChatAction < Request::Base

    attr_accessor :chat_id, :action

    VALID_ACTIONS = [:typing, :upload_photo, :record_video, :upload_video, :record_audio, :upload_audio, :upload_document, :find_location]

    validates :chat_id, :action, presence: true
    validates :chat_id, numericality: true, unless: -> { chat_id.to_s[0,1] == '@' }
    validates :action, inclusion: { in: VALID_ACTIONS }

    def initialize(attributes = {})
      super(attributes)
      @method = :sendChatAction
    end
  end
end
