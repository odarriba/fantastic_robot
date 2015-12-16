module TelegramBot
  class Model::Update < Model::Base
    
    attr_accessor :update_id, :message

    # Field conversions of this model
    FIELD_CONVERSIONS = {
      message: TelegramBot::Model::Message
    }

  end
end
