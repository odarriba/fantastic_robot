require 'test_helper'

class SendMessageTest < ActiveSupport::TestCase
  include RequestWithAttributes
  include ModelWithRequiredAttributes
  include ModelWithNumericAttributes
  include ModelWithChatId
  include ModelWithSerialization

  def setup
    @model_name = :send_message
    @subject = FactoryGirl.build(@model_name)
  end

  def test_that_factory_is_valid
    assert(@subject.valid?)
  end

  def test_request_with_attributes
    request_with_attributes(@model_name)
  end

  def test_model_with_required_attributes
    model_with_required_attributes(@model_name, [:chat_id, :text])
  end

  def test_model_with_numeric_attributes
    model_with_numeric_attributes(@model_name, [:reply_to_message_id])
  end

  def test_chat_id
    model_with_chat_id(@model_name, :chat_id)
  end

  def test_model_with_serialization
    model_with_serialization(@model_name)
  end

  def test_method
    assert_equal(:sendMessage, @subject.method)
  end

  def test_boolean_field
    [true, false].each do |v|
      @subject.disable_web_page_preview = v
      assert(@subject.valid?, "Object not valid with disable_web_page_preview=#{v}")
    end

    @subject.disable_web_page_preview = Faker::Lorem.word
    assert_not(@subject.valid?, "Object valid with disable_web_page_preview=#{@subject.disable_web_page_preview}")
  end
end
