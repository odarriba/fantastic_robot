# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :send_location, class: FantasticRobot::Request::SendLocation do
    chat_id { Faker::Number.number(10) }
    latitude { Faker::Number.decimal(2, 4) }
    longitude { Faker::Number.decimal(2, 4) }
    reply_to_message_id { Faker::Number.number(10) }
    reply_markup { nil }

    factory :send_location_without_optional_fields do
      reply_to_message_id { nil }
      reply_markup { nil }
    end
  end
end
