# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :send_sticker, class: FantasticRobot::Request::SendSticker do
    chat_id { Faker::Number.number(10) }
    sticker { Faker::Lorem.word }
    reply_to_message_id { Faker::Number.number(10) }
    reply_markup { nil }

    factory :send_sticker_without_optional_fields do
      reply_to_message_id { nil }
      reply_markup { nil }
    end
  end
end
