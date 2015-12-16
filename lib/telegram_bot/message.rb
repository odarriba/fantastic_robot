require 'telegram_bot/message_element/base'
require 'telegram_bot/message_element/photo_size'
require 'telegram_bot/message_element/audio'
require 'telegram_bot/message_element/contact'
require 'telegram_bot/message_element/document'
require 'telegram_bot/message_element/location'
require 'telegram_bot/message_element/sticker'
require 'telegram_bot/message_element/video'
require 'telegram_bot/message_element/voice'
require 'telegram_bot/message_element/chat'

module TelegramBot
  class Message
    include Virtus.model

    # Message metadata
    attribute :message_id,              Integer
    attribute :from,                    TelegramBot::User
    attribute :date,                    Integer
    attribute :chat,                    TelegramBot::MessageElement::Chat
    attribute :fordward_from,           TelegramBot::User
    attribute :forward_date,            Integer
    attribute :reply_to_message,        TelegramBot::Message

    # Content delivered
    attribute :text,                    String
    attribute :audio,                   TelegramBot::MessageElement::Audio
    attribute :document,                TelegramBot::MessageElement::Document
    # attribute :photo,                   TelegramBot::MessageElement::Photo
    attribute :sticker,                 TelegramBot::MessageElement::Sticker
    attribute :video,                   TelegramBot::MessageElement::Video
    attribute :voice,                   TelegramBot::MessageElement::Voice
    attribute :caption,                 String
    attribute :contact,                 TelegramBot::MessageElement::Contact
    attribute :location,                TelegramBot::MessageElement::Location

    # Chat operations
    attribute :new_chat_participant,    TelegramBot::User
    attribute :left_chat_participan,    TelegramBot::User
    attribute :new_chat_title,          String
    # attribute :new_chat_photo,          Array of PhotoSize
    attribute :delete_chat_photo,       Boolean, default: false
    attribute :group_chat_created,      Boolean, default: false
    attribute :supergroup_chat_created, Boolean, default: false
    attribute :channel_chat_created,    Boolean, default: false
    attribute :migrate_to_chat_id,      Integer
    attribute :migrate_from_chat_id,    Integer
  end
end
