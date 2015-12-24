require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  include ModelWithAttributes
  include ModelWithRequiredAttributes
  include ModelWithNumericAttributes

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
    model_with_numeric_attributes(@model_name, [:message_id, :date, :migrate_to_chat_id, :migrate_from_chat_id])
  end
end
