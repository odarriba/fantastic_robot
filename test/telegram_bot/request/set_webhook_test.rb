require 'test_helper'

class SetWebhookTest < ActiveSupport::TestCase
  include RequestWithAttributes
  include ModelWithRequiredAttributes
  include ModelWithSerialization

  def setup
    @model_name = :set_webhook
    @subject = FactoryGirl.build(@model_name)
  end

  def test_that_factory_is_valid
    assert(@subject.valid?)
  end

  def test_request_with_attributes
    request_with_attributes(@model_name)
  end

  def test_model_with_required_attributes
    model_with_required_attributes(@model_name, [:url])
  end

  def test_model_with_serialization
    model_with_serialization(@model_name)
  end

  def test_method
    assert_equal(:setWebhook, @subject.method)
  end

  def test_http_url
    @subject.url = "http://#{Faker::Internet.domain_name}"
    assert_not(@subject.valid?, "Not secure URL's are validated!")
  end
end
