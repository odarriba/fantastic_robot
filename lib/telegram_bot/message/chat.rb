module TelegramBot
  # This object represents a chat.
  class Messages::Chat < Messages::Base
    attribute :id,          Integer
    attribute :type,        String
    attribute :title,       String
    attribute :username,    String
    attribute :first_name,  String
    attribute :last_name,   String
  end
end
