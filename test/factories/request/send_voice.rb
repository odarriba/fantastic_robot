# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :send_voice, class: FantasticRobot::Request::SendVoice do
    chat_id { Faker::Number.number(10) }
    voice { Faker::Lorem.word }
    duration { Faker::Number.number(3) }
    reply_to_message_id { Faker::Number.number(10) }
    reply_markup { nil }

    factory :send_voice_without_optional_fields do
      duration { nil }
      reply_to_message_id { nil }
      reply_markup { nil }
    end
  end
end
