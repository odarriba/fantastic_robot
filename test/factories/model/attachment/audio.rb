# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attachment_audio, class: FantasticRobot::Model::Attachment::Audio do
    file_id { Faker::Lorem.word }
    file_size { Faker::Number.number(10) }
    duration { Faker::Number.number(3) }
    performer { Faker::Name.name }
    title { Faker::Lorem.sentence }
    mime_type { ['audio/aac', 'audio/mp4', 'audio/mpeg', 'audio/ogg', 'audio/wav', 'audio/webm'].sample }

    factory :attachment_audio_without_optional_fields do
      file_size { nil }
      performer { nil }
      title { nil }
      mime_type { nil }
    end
  end
end
