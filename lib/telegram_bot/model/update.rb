module TelegramBot
  class Model::Update < Model::Base

    attr_accessor :update_id, :message

    validates :update_id, presence: true
    validates :update_id, numericality: true

    # Field conversions of this model
    FIELD_CONVERSIONS = {
      message: TelegramBot::Model::Message
    }

  end
end
