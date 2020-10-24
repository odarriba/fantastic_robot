require 'test_helper'

class ChatTest < ActiveSupport::TestCase
  include ModelWithAttributes
  include ModelWithRequiredAttributes
  include ModelWithNumericAttributes
  include ModelWithSerialization

  def setup
    @model_name = :chat
    @subject = FactoryBot.build(@model_name)
  end

  def test_that_factory_is_valid
    assert(@subject.valid?)
  end

  def test_model_with_attributes
    model_with_attributes(@model_name)
  end

  def test_model_with_required_attributes
    model_with_required_attributes(@model_name, [:id, :type])
  end

  def test_numeric_attributes
    model_with_numeric_attributes(@model_name, [:id])
  end

  def test_model_with_serialization
    model_with_serialization(@model_name)
  end

  def test_type_possibilities
    FantasticRobot::Model::Chat::VALID_TYPES.each do |t|
      @subject.type = t
      assert(@subject.valid?, "Type not valid - #{t}")
    end

    # Try an invalid one
    @subject.type = Faker::Lorem.paragraph
    assert(!@subject.valid?, "Type invlid has been validated.")
  end
end
