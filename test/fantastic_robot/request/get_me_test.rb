require 'test_helper'

class GetMeTest < ActiveSupport::TestCase
  include RequestWithAttributes
  include ModelWithChatId
  include ModelWithSerialization

  def setup
    @model_name = :get_me
    @subject = FactoryBot.build(@model_name)
  end

  def test_that_factory_is_valid
    assert(@subject.valid?)
  end

  def test_request_with_attributes
    request_with_attributes(@model_name)
  end

  def test_model_with_serialization
    model_with_serialization(@model_name)
  end

  def test_method
    assert_equal(:getMe, @subject.method)
  end
end
