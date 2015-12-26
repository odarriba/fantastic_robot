require "active_support"

module ModelWithConversions
  extend ActiveSupport::Concern

  included do
    def model_with_conversions(model_name, fields_factories = {})
      fields_factories.each do |field_name, factory_name|
        subject = FactoryGirl.build(model_name)
        assert(subject.valid?, "Subject isn't valid with default factory values.")

        # Assign as a Hash of properties
        object = FactoryGirl.attributes_for(factory_name)
        subject.send("#{field_name}=", object)

        assert(subject.valid?, "Subject isn't valid after assigning a hash of values to the field - #{field_name}")
        assert_equal(subject.class::FIELD_CONVERSIONS[field_name], subject.send("#{field_name}").class, "Object returned hasn't got the type expected - #{field_name}")

        # Assign as a Hash of properties
        object = FactoryGirl.build(factory_name)
        subject.send("#{field_name}=", object)

        assert(subject.valid?, "Subject isn't valid after assigning a built object to the field - #{field_name}")
        assert_equal(subject.class::FIELD_CONVERSIONS[field_name], subject.send("#{field_name}").class, "Object returned hasn't got the type expected - #{field_name}")
      end
    end
  end
end
