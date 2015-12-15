module TelegramBot
  class Update
    include Virtus.model

    attribute :update_id, Integer
    attribute :message,   TelegramBot::Message
  end
end
