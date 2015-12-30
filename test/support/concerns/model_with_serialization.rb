require "active_support"

module ModelWithSerialization
  extend ActiveSupport::Concern

  included do
    def model_with_serialization(model_name)
      attribute_list = FactoryGirl.attributes_for(model_name)
      object = FactoryGirl.build(model_name, attribute_list)

      assert_equal attribute_list, object.to_h
      assert_equal attribute_list.to_json, object.to_json
    end
  end
end
