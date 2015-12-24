require 'test_helper'

class ChatTest < ActiveSupport::TestCase
  include ModelWithAttributes

  def setup
    @model_name = :chat
    @subject = FactoryGirl.build(@model_name)
  end
end
