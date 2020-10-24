require "active_support"

module ModelWithChatId
  extend ActiveSupport::Concern

  included do
    def model_with_chat_id(model_name, id_field)
      attribute_list = FactoryBot.attributes_for(model_name)
      object = FactoryBot.build(model_name, attribute_list)

      assert(object.valid?, "Default object isn't valid!")

      object.send("#{id_field}=", Faker::Lorem.word)
      assert_not(object.valid?, "Word without '@' is valid! - field :#{id_field}")

      object.send("#{id_field}=", "@#{Faker::Lorem.word}")
      assert(object.valid?, "Word with '@' is invalid! - field :#{id_field}")

      object.send("#{id_field}=", Faker::Number.number(10))
      assert(object.valid?, "Number is invalid! - field :#{id_field}")
    end
  end
end
