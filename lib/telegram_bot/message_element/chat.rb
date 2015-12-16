module TelegramBot
  # This object represents a chat.
  class MessageElement::Chat < MessageElement::Base
    include Virtus.model

    attribute :id,          Integer
    attribute :type,        String
    attribute :title,       String
    attribute :username,    String
    attribute :first_name,  String
    attribute :last_name,   String
  end
end
