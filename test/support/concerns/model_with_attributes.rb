require "active_support"

module ModelWithAttributes
  extend ActiveSupport::Concern

  included do

    def test_that_model_has_attributes
      attribute_list = FactoryGirl.attributes_for(@model_name)
      object = FactoryGirl.build(@model_name, attribute_list)

      attribute_list.each do |attrib, value|
        # Test that the attribute is readable
        assert_respond_to(@subject, attrib)

        # Test that the attribute returns it's value
        assert_equal(@subject.send(attrib), value)
      end
    end
  end
end
