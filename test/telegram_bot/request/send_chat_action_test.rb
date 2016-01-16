require 'test_helper'

class SendChatActionTest < ActiveSupport::TestCase
  include RequestWithAttributes
  include ModelWithRequiredAttributes
  include ModelWithChatId
  include ModelWithSerialization

  def setup
    @model_name = :send_chat_action
    @subject = FactoryGirl.build(@model_name)
  end

  def test_that_factory_is_valid
    assert(@subject.valid?)
  end

  def test_request_with_attributes
    request_with_attributes(@model_name)
  end

  def test_model_with_required_attributes
    model_with_required_attributes(@model_name, [:chat_id, :action])
  end

  def test_chat_id
    model_with_chat_id(@model_name, :chat_id)
  end

  def test_model_with_serialization
    model_with_serialization(@model_name)
  end

  def test_method
    assert_equal(:sendChatAction, @subject.method)
  end

  def test_action_possibilities
    TelegramBot::Request::SendChatAction::VALID_ACTIONS.each do |action|
      @subject.action = action
      assert(@subject.valid?, "Action not valid: #{action}")
    end

    @subject.action = Faker::Lorem.word
    assert_not(@subject.valid?, "Action that souldn't be valid passes validation: #{@subject.action}")
  end
end
