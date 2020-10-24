# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :send_photo, class: FantasticRobot::Request::SendPhoto do
    chat_id { Faker::Number.number(10) }
    photo { Faker::Lorem.word }
    caption { Faker::Lorem.sentence }
    reply_to_message_id { Faker::Number.number(10) }
    reply_markup { nil }

    factory :send_photo_without_optional_fields do
      caption { nil }
      reply_to_message_id { nil }
      reply_markup { nil }
    end
  end
end
