# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :chat, class: FantasticRobot::Model::Chat do
    id { Faker::Number.number(10) }
    type { FantasticRobot::Model::Chat::VALID_TYPES.sample }
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
