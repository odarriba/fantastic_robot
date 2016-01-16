# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :send_audio, class: FantasticRobot::Request::SendAudio do
    chat_id { Faker::Number.number(10) }
    audio { Faker::Lorem.word }
    duration { Faker::Number.number(3) }
    performer { Faker::Name.name }
    title { Faker::Lorem.sentence }
    reply_to_message_id { Faker::Number.number(10) }
    reply_markup { nil }

    factory :send_audio_without_optional_fields do
      duration { nil }
      performer { nil }
      title { nil }
      reply_to_message_id { nil }
      reply_markup { nil }
    end
  end
end
