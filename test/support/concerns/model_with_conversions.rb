require "active_support"

module ModelWithConversions
  extend ActiveSupport::Concern

  included do
    def model_with_conversions(model_name, fields_factories = {})
      fields_factories.each do |field_name, factory_name|
        subject = FactoryBot.build(model_name)
        assert(subject.valid?, "Subject isn't valid with default factory values.")

        # If the factoy name is in an array, we should build a collection of objects
        if (factory_name.is_a?(Array) && !factory_name.blank?)
          objects_hash = [] # Hashed version
          objects_built = [] # Built version
          samples = (2+rand(8)) # Number of samples for the collection

          # Build the samples
          (0..samples).each do |i|
            objects_hash << FactoryBot.attributes_for(factory_name.first)
            objects_built << FactoryBot.build(factory_name.first)
          end

          # Try to assign and verify both hashes and built objects
          [objects_hash, objects_built].each do |value|
            subject.send("#{field_name}=", value)
            assert(subject.valid?, "Subject isn't valid after assigning the field - #{field_name}")

            (0..samples).each do |i|
              assert_equal(subject.class::FIELD_CONVERSIONS[field_name], subject.send("#{field_name}")[i].class, "Object returned hasn't got the type expected - #{field_name}")
            end
          end

        elsif (factory_name.is_a?(Symbol))
          # If it is a symbol, just an object
          object_hash = FactoryBot.attributes_for(factory_name)
          object_build = FactoryBot.build(factory_name)

          # Try to assign and verify both hash and built object
          [object_hash, object_build].each do |value|
            subject.send("#{field_name}=", value)

            assert(subject.valid?, "Subject isn't valid after assigning the field - #{field_name}")
            assert_equal(subject.class::FIELD_CONVERSIONS[field_name], subject.send("#{field_name}").class, "Object returned hasn't got the type expected - #{field_name}")
          end
        end
      end
    end
  end
end
