# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message, class: TelegramBot::Model::Message do
    message_id { Faker::Number.number(10) }
    date { Time.now.to_i }
    chat { attributes_for :chat }
    fordward_date { Time.now.to_i }
    text { Faker::Lorem.paragraph }
    caption { Faker::Lorem.paragraph }
    new_chat_title { Faker::Lorem.paragraph }
    delete_chat_photo { true }
    group_chat_created { true }
    supergroup_chat_created { true }
    channel_chat_created { true }
    migrate_to_chat_id { Faker::Number.number(10) }
    migrate_from_chat_id { Faker::Number.number(10) }
  end
end
