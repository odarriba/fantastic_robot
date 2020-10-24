require 'test_helper'

class AttachmentVideoTest < ActiveSupport::TestCase
  include ModelWithAttributes
  include ModelWithRequiredAttributes
  include ModelWithNumericAttributes
  include ModelWithSerialization
  include ModelWithConversions

  def setup
    @model_name = :attachment_video
    @subject = FactoryBot.build(@model_name)
  end

  def test_that_factory_is_valid
    assert(@subject.valid?)
  end

  def test_model_with_attributes
    model_with_attributes(@model_name)
  end

  def test_model_with_required_attributes
    model_with_required_attributes(@model_name, [:file_id, :width, :height, :duration])
  end

  def test_numeric_attributes
    model_with_numeric_attributes(@model_name, [:file_size, :width, :height, :duration])
  end

  def test_model_with_serialization
    model_with_serialization(@model_name)
  end

  def test_model_with_conversions
    model_with_conversions(@model_name, {thumb: :attachment_photo_size})
  end
end
