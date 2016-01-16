require 'test_helper'

class SendAudioTest < ActiveSupport::TestCase
  include RequestWithAttributes
  include ModelWithRequiredAttributes
  include ModelWithNumericAttributes
  include ModelWithChatId
  include ModelWithSerialization

  def setup
    @model_name = :send_audio
    @subject = FactoryGirl.build(@model_name)
  end

  def test_that_factory_is_valid
    assert(@subject.valid?)
  end

  def test_request_with_attributes
    request_with_attributes(@model_name)
  end

  def test_model_with_required_attributes
    model_with_required_attributes(@model_name, [:chat_id, :audio])
  end

  def test_model_with_numeric_attributes
    model_with_numeric_attributes(@model_name, [:duration, :reply_to_message_id])
  end

  def test_chat_id
    model_with_chat_id(@model_name, :chat_id)
  end

  def test_model_with_serialization
    model_with_serialization(@model_name)
  end

  def test_method
    assert_equal(:sendAudio, @subject.method)
  end
end
