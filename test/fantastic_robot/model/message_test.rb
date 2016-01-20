require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  include ModelWithAttributes
  include ModelWithRequiredAttributes
  include ModelWithNumericAttributes
  include ModelWithSerialization
  include ModelWithConversions

  def setup
    @model_name = :message
    @subject = FactoryGirl.build(@model_name)
  end

  def test_that_factory_is_valid
    assert(@subject.valid?)
  end

  def test_model_with_attributes
    model_with_attributes(@model_name)
  end

  def test_model_with_required_attributes
    model_with_required_attributes(@model_name, [:message_id, :date, :chat])
  end

  def test_numeric_attributes
    model_with_numeric_attributes(@model_name, [:message_id, :date, :forward_date, :migrate_to_chat_id, :migrate_from_chat_id])
  end

  def test_model_with_serialization
    model_with_serialization(@model_name)
  end

  def test_model_with_conversions
    model_with_conversions(@model_name,
    {
      from: :user,
      chat: :chat,
      forward_from: :user,
      reply_to_message: :message,
      audio: :attachment_audio,
      document: :attachment_document,
      photo: [:attachment_photo_size],
      sticker: :attachment_sticker,
      video: :attachment_video,
      voice: :attachment_voice,
      contact: :attachment_contact,
      location: :attachment_location,
      new_chat_participant: :user,
      left_chat_participant: :user,
      new_chat_photo: [:attachment_photo_size]
    })
  end
end
