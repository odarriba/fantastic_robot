# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, class: TelegramBot::Model::User do
    id { Faker::Number.number(10) }
    username { Faker::Internet.user_name }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    factory :user_without_optional_fields do
      username { nil }
      last_name { nil }
    end
  end
end
