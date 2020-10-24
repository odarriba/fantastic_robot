require "active_support"

module RequestWithAttributes
  extend ActiveSupport::Concern

  included do
    def request_with_attributes(model_name)
      attribute_list = FactoryBot.attributes_for(model_name)
      object = FactoryBot.build(model_name, attribute_list)

      attribute_list.each do |attrib, value|
        # Test that the attribute is readable
        assert_respond_to(object, "#{attrib}=", "Error while testing attribute :#{attrib}")
      end
    end
  end
end
