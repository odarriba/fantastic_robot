require 'test_helper'

class UserTest < ActiveSupport::TestCase
  include ModelWithAttributes
  include ModelWithRequiredAttributes

  def setup
    @model_name = :user
    @required_attributes = [:id, :first_name]
    @subject = FactoryGirl.build(@model_name)
  end

  def test_that_factory_is_valid
    assert(@subject.valid?)
  end

  def test_id_numericality
    @subject.id = "test"
    assert(!@subject.valid?)

    @subject.id = 2
    assert(@subject.valid?)
  end

  def test_model_with_attributes
    model_with_attributes(@model_name)
  end

  def test_model_with_required_attributes
    model_with_required_attributes(@model_name, @required_attributes)
  end
end
