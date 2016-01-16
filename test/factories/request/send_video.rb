# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :send_video, class: TelegramBot::Request::SendVideo do
    chat_id { Faker::Number.number(10) }
    video { Faker::Lorem.word }
    duration { Faker::Number .number(3) }
    caption { Faker::Lorem.sentence }
    reply_to_message_id { Faker::Number.number(10) }
    reply_markup { nil }

    factory :send_video_without_optional_fields do
      duration { nil }
      caption { nil }
      reply_to_message_id { nil }
      reply_markup { nil }
    end
  end
end
