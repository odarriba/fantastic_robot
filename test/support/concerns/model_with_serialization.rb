require "active_support"

module ModelWithSerialization
  extend ActiveSupport::Concern

  included do
    def model_with_serialization(model_name)
      attribute_list = FactoryBot.attributes_for(model_name)
      object = FactoryBot.build(model_name, attribute_list)

      # Test hash conversion
      attribute_list.each do |key, value|
        assert_equal attribute_list[key], object.to_h[key]
      end

      # Test JSON conversion
      attribute_list_from_json = JSON.parse(attribute_list.to_json)
      object_from_json = JSON.parse(object.to_json)

      attribute_list_from_json.each do |key, value|
        assert_equal attribute_list_from_json[key], object_from_json[key]
      end
    end
  end
end
