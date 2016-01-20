# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message, class: FantasticRobot::Model::Message do
    message_id { Faker::Number.number(10) }
    date { Time.now.to_i }
    chat { attributes_for :chat }
    forward_date { Time.now.to_i }
    text { Faker::Lorem.paragraph }
    caption { Faker::Lorem.paragraph }
    new_chat_title { Faker::Lorem.paragraph }
    delete_chat_photo { true }
    group_chat_created { true }
    supergroup_chat_created { true }
    channel_chat_created { true }
    migrate_to_chat_id { Faker::Number.number(10) }
    migrate_from_chat_id { Faker::Number.number(10) }

    factory :message_without_optional_fields do
      forward_date { nil }
      text { nil }
      caption { nil }
      new_chat_title { nil }
      delete_chat_photo { nil }
      group_chat_created { nil }
      supergroup_chat_created { nil }
      channel_chat_created { nil }
      migrate_to_chat_id { nil }
      migrate_from_chat_id { nil }
    end
  end
end
