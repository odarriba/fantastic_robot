require 'test_helper'

class AttachmentVoiceTest < ActiveSupport::TestCase
  include ModelWithAttributes
  include ModelWithRequiredAttributes
  include ModelWithNumericAttributes
  include ModelWithSerialization

  def setup
    @model_name = :attachment_voice
    @subject = FactoryBot.build(@model_name)
  end

  def test_that_factory_is_valid
    assert(@subject.valid?)
  end

  def test_model_with_attributes
    model_with_attributes(@model_name)
  end

  def test_model_with_required_attributes
    model_with_required_attributes(@model_name, [:file_id, :duration])
  end

  def test_numeric_attributes
    model_with_numeric_attributes(@model_name, [:file_size, :duration])
  end

  def test_model_with_serialization
    model_with_serialization(@model_name)
  end
end
