require "active_support"

module ModelWithNumericAttributes
  extend ActiveSupport::Concern

  included do
    def model_with_numeric_attributes(model_name, numeric_attributes)
      attribute_list = FactoryGirl.attributes_for(model_name)
      object = FactoryGirl.build(model_name, attribute_list)

      numeric_attributes.each do |attrib|
        # Test that the attributes received are in the model
        assert_includes(attribute_list.keys, attrib, "Attribute not found in model - :#{attrib}")

        # Change it to a string
        object.send("#{attrib}=", Faker::Lorem.word)
        assert(!object.valid?, "Attribute not checked for numericality - :#{attrib}")

        object.send("#{attrib}=", Faker::Number.number(10))
        assert(object.valid?, "Attribute not valid as number - :#{attrib}")
      end
    end
  end
end
