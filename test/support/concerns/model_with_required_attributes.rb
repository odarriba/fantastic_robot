require "active_support"

module ModelWithRequiredAttributes
  extend ActiveSupport::Concern

  included do
    def model_with_required_attributes(model_name, required_attributes)
      attribute_list = FactoryGirl.attributes_for(model_name)
      object = FactoryGirl.build(model_name, attribute_list)

      required_attributes.each do |attrib|
        object = FactoryGirl.build(model_name, attribute_list)

        # Check that these attributes
        assert_includes(attribute_list, attrib, "Attribute not found in model - :#{attrib}")

        # Try to assign a nil value
        object.send("#{attrib}=", nil)

        # Object musn't be valid
        assert(!object.valid?, "Attribute isn't required - :#{attrib}")
      end

      object = FactoryGirl.build(model_name, attribute_list)

      # Try to remove all the non-required attributes to check them
      (attribute_list.keys - required_attributes).each do |attrib|
        # Try to assign a nil value
        object.send("#{attrib}=", nil)

        # Object must be valid
        assert(object.valid?, "Attribute is required when it isn't expected - :#{attrib}")
      end
    end
  end
end
