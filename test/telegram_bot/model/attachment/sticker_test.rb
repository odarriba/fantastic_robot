require 'test_helper'

class AttachmentStickerTest < ActiveSupport::TestCase
  include ModelWithAttributes
  include ModelWithRequiredAttributes
  include ModelWithNumericAttributes
  include ModelWithConversions

  def setup
    @model_name = :attachment_sticker
    @subject = FactoryGirl.build(@model_name)
  end

  def test_that_factory_is_valid
    assert(@subject.valid?)
  end

  def test_model_with_attributes
    model_with_attributes(@model_name)
  end

  def test_model_with_required_attributes
    model_with_required_attributes(@model_name, [:file_id, :width, :height])
  end

  def test_numeric_attributes
    model_with_numeric_attributes(@model_name, [:file_size, :width, :height])
  end

  def test_model_with_conversions
    model_with_conversions(@model_name, {thumb: :attachment_photo_size})
  end
end
