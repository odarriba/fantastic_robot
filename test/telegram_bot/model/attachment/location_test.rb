require 'test_helper'

class AttachmentLocationTest < ActiveSupport::TestCase
  include ModelWithAttributes
  include ModelWithRequiredAttributes
  include ModelWithNumericAttributes

  def setup
    @model_name = :attachment_location
    @subject = FactoryGirl.build(@model_name)
  end

  def test_that_factory_is_valid
    assert(@subject.valid?)
  end

  def test_model_with_attributes
    model_with_attributes(@model_name)
  end

  def test_model_with_required_attributes
    model_with_required_attributes(@model_name, [:latitude, :longitude])
  end

  def test_numeric_attributes
    model_with_numeric_attributes(@model_name, [:latitude, :longitude])
  end
end
