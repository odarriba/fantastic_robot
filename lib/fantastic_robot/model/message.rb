require 'fantastic_robot/model/attachment/base'
require 'fantastic_robot/model/attachment/photo_size'
require 'fantastic_robot/model/attachment/audio'
require 'fantastic_robot/model/attachment/contact'
require 'fantastic_robot/model/attachment/document'
require 'fantastic_robot/model/attachment/location'
require 'fantastic_robot/model/attachment/sticker'
require 'fantastic_robot/model/attachment/video'
require 'fantastic_robot/model/attachment/voice'

module FantasticRobot
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
      from: FantasticRobot::Model::User,
      chat: FantasticRobot::Model::Chat,
      forward_from: FantasticRobot::Model::User,
      reply_to_message: FantasticRobot::Model::Message,
      audio: FantasticRobot::Model::Attachment::Audio,
      document: FantasticRobot::Model::Attachment::Document,
      photo: FantasticRobot::Model::Attachment::PhotoSize,
      sticker: FantasticRobot::Model::Attachment::Sticker,
      video: FantasticRobot::Model::Attachment::Video,
      voice: FantasticRobot::Model::Attachment::Voice,
      contact: FantasticRobot::Model::Attachment::Contact,
      location: FantasticRobot::Model::Attachment::Location,
      new_chat_participant: FantasticRobot::Model::User,
      left_chat_participant: FantasticRobot::Model::User,
      new_chat_photo: FantasticRobot::Model::Attachment::PhotoSize
    }

  end
end
