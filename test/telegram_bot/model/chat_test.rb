require 'test_helper'

class ChatTest < ActiveSupport::TestCase
  include ModelWithAttributes
  include ModelWithRequiredAttributes

  def setup
    @model_name = :chat
    @required_attributes = [:id, :type]
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

  def test_type_possibilities
    TelegramBot::Model::Chat::VALID_TYPES.each do |t|
      @subject.type = t
      assert(@subject.valid?, "Type not valid - #{t}")
    end

    # Try an invalid one
    @subject.type = Faker::Lorem.paragraph
    assert(!@subject.valid?, "Type invlid has been validated.")
  end
end
