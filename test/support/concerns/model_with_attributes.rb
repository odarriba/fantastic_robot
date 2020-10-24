require "active_support"

module ModelWithAttributes
  extend ActiveSupport::Concern

  included do
    def model_with_attributes(model_name)
      attribute_list = FactoryBot.attributes_for(model_name)
      object = FactoryBot.build(model_name, attribute_list)

      attribute_list.each do |attrib, value|
        # Test that the attribute is readable
        assert_respond_to(object, "#{attrib}=", "Error while testing attribute :#{attrib}")

        if object.class::FIELD_CONVERSIONS.key?(attrib) && !value.nil?
          # Test that the attribute has the required type
          assert_equal(object.send(attrib).class, object.class::FIELD_CONVERSIONS[attrib], "Conversion error on field :#{attrib}")
        else
          # Test that the attribute returns it's value
          assert_equal(object.send(attrib), value, "Error while testing attribute :#{attrib}")
        end
      end
    end
  end
end
