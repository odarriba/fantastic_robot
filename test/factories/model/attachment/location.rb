# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attachment_location, class: TelegramBot::Model::Attachment::Location do
    longitude { Faker::Number.between(-180.0, 180.0) }
    latitude { Faker::Number.between(-90.0, 90.0) }
  end
end
