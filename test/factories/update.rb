# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :update, class: TelegramBot::Model::Update do
    update_id { Faker::Number.number(10) }
  end
end
