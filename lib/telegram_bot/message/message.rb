module TelegramBot
  # This object represents a message.
  class Message::Message < Message::Base
    # Message metadata
    attribute :message_id,              Integer
    attribute :from,                    TelegramBot::Message::User
    attribute :date,                    Integer
    attribute :chat,                    TelegramBot::Message::Chat
    attribute :fordward_from,           TelegramBot::Message::User
    attribute :forward_date,            Integer
    attribute :reply_to_message,        TelegramBot::Message::Message

    # Content delivered
    attribute :text,                    String
    attribute :audio,                   TelegramBot::Message::Attachment::Audio
    attribute :document,                TelegramBot::Message::Attachment::Document
    attribute :photo,                   TelegramBot::Message::Attachment::Photo
    attribute :sticker,                 TelegramBot::Message::Attachment::Sticker
    attribute :video,                   TelegramBot::Message::Attachment::Video
    attribute :voice,                   TelegramBot::Message::Attachment::Voice
    attribute :caption,                 String
    attribute :contact,                 TelegramBot::Message::Attachment::Contact
    attribute :location,                TelegramBot::Message::Attachment::Location

    # Chat operations
    attribute :new_chat_participant,    TelegramBot::Message::User
    attribute :left_chat_participan,    TelegramBot::Message::User
    attribute :new_chat_title,          String
    attribute :new_chat_photo,          Array of PhotoSize
    attribute :delete_chat_photo,       Boolean, default: false
    attribute :group_chat_created,      Boolean, default: false
    attribute :supergroup_chat_created, Boolean, default: false
    attribute :channel_chat_created,    Boolean, default: false
    attribute :migrate_to_chat_id,      Integer
    attribute :migrate_from_chat_id,    Integer
  end
end
