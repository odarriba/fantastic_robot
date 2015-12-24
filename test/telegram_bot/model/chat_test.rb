require 'test_helper'

class ChatTest < ActiveSupport::TestCase
  include ModelWithAttributes
  include ModelWithRequiredAttributes

  def setup
    @model_name = :chat
    @required_attributes = [:id]
    @subject = FactoryGirl.build(@model_name)
  end

  def test_model_with_attributes
    model_with_attributes(@model_name)
  end

  def test_model_with_required_attributes
    model_with_required_attributes(@model_name, @required_attributes)
  end
end
