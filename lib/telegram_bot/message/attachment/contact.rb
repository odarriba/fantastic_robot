module TelegramBot
  # This object represents a phone contact.
  class Message::Attachment::Contact < Message::Attachment::Base
    attribute :phone_number,  String
    attribute :first_name,    String
    attribute :last_name,     String
    attribute :user_id,       Integer
  end
end
