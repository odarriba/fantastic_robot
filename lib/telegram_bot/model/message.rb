require 'telegram_bot/model/attachment/base'
require 'telegram_bot/model/attachment/photo_size'
require 'telegram_bot/model/attachment/audio'
require 'telegram_bot/model/attachment/contact'
require 'telegram_bot/model/attachment/document'
require 'telegram_bot/model/attachment/location'
require 'telegram_bot/model/attachment/sticker'
require 'telegram_bot/model/attachment/video'
require 'telegram_bot/model/attachment/voice'

module TelegramBot
  class Model::Message < Model::Base

    attr_accessor :message_id, :from, :date, :chat, :forward_from, :fordward_date,
      :reply_to_message

    validates :message_id, :date, :chat, presence: true
    validates :message_id, :date, numericality: true
    validates :fordward_date, numericality: true, unless: 'fordward_date.blank?'

    attr_accessor :text, :audio, :document, :photo, :sticker, :video, :voice,
      :caption, :contact, :location

    attr_accessor :new_chat_participant, :left_chat_participant, :new_chat_title, :new_chat_photo,
      :delete_chat_photo, :group_chat_created, :supergroup_chat_created,
      :channel_chat_created, :migrate_to_chat_id, :migrate_from_chat_id

    validates :migrate_to_chat_id, numericality: true, unless: 'migrate_to_chat_id.blank?'
    validates :migrate_from_chat_id, numericality: true, unless: 'migrate_from_chat_id.blank?'

    # Field conversions of this model
    FIELD_CONVERSIONS = {
      from: TelegramBot::Model::User,
      chat: TelegramBot::Model::Chat,
      forward_from: TelegramBot::Model::User,
      reply_to_message: TelegramBot::Model::Message,
      audio: TelegramBot::Model::Attachment::Audio,
      document: TelegramBot::Model::Attachment::Document,
      photo: TelegramBot::Model::Attachment::PhotoSize,
      sticker: TelegramBot::Model::Attachment::Sticker,
      video: TelegramBot::Model::Attachment::Video,
      voice: TelegramBot::Model::Attachment::Voice,
      contact: TelegramBot::Model::Attachment::Contact,
      location: TelegramBot::Model::Attachment::Location,
      new_chat_participant: TelegramBot::Model::User,
      left_chat_participant: TelegramBot::Model::User,
      new_chat_photo: TelegramBot::Model::Attachment::PhotoSize
    }

  end
end
