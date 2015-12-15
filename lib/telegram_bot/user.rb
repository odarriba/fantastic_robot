module TelegramBot
  # This object represents a Telegram user or bot.
  class User
    include Virtus.model

    attribute :id,          Integer
    attribute :first_name,  String
    attribute :last_name,   String
    attribute :username,    String
  end
end
