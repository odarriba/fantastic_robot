module TelegramBot
  class Message::Update < Message::Base
    attribute :update_id, Integer
    attribute :message,   TelegramBot::Message::Message
  end
end
