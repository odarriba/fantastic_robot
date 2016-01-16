# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attachment_voice, class: TelegramBot::Model::Attachment::Voice do
    file_id { Faker::Lorem.word }
    file_size { Faker::Number.number(10) }
    duration { Faker::Number.number(3) }
    mime_type { ['audio/aac', 'audio/mp4', 'audio/mpeg', 'audio/ogg', 'audio/wav', 'audio/webm'].sample }

    factory :attachment_voice_without_optional_fields do
      file_size { nil }
      mime_type { nil }
    end
  end
end
