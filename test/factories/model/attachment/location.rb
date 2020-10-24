# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :attachment_location, class: FantasticRobot::Model::Attachment::Location do
    longitude { Faker::Number.between(-180.0, 180.0) }
    latitude { Faker::Number.between(-90.0, 90.0) }
  end
end
