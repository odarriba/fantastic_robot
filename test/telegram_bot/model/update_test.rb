require 'test_helper'

class UpdateTest < ActiveSupport::TestCase
  include ModelWithAttributes
  include ModelWithRequiredAttributes
  include ModelWithNumericAttributes

  def setup
    @model_name = :update
    @subject = FactoryGirl.build(@model_name)
  end

  def test_that_factory_is_valid
    assert(@subject.valid?)
  end

  def test_model_with_attributes
    model_with_attributes(@model_name)
  end

  def test_model_with_required_attributes
    model_with_required_attributes(@model_name, [:update_id])
  end

  def test_numeric_attributes
    model_with_numeric_attributes(@model_name, [:update_id])
  end

  def test_message_conversion
    subject = TelegramBot::Model::Update.new(FactoryGirl.attributes_for(:update_with_message))

    assert(subject.valid?)
    assert_equal(TelegramBot::Model::Message, subject.message.class)
  end
end
