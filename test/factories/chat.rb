# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chat, class: TelegramBot::Model::Chat do
    id { Faker::Number.number(10) }
    type { TelegramBot::Model::Chat::VALID_TYPES.sample }
    title { Faker::Lorem.sentence }
    username { Faker::Internet.user_name }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    factory :chat_without_optional_fields do
      title { nil }
      username { nil }
      first_name { nil }
      last_name { nil }
    end
  end
end
