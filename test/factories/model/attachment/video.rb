# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :attachment_video, class: FantasticRobot::Model::Attachment::Video do
    file_id { Faker::Lorem.word }
    file_size { Faker::Number.number(10) }
    width { Faker::Number.number(3) }
    height { Faker::Number.number(3) }
    duration { Faker::Number.number(3) }
    thumb { attributes_for :attachment_photo_size }
    mime_type { ['video/mp4', 'video/ogg', 'video/webm'].sample }

    factory :attachment_video_without_optional_fields do
      file_size { nil }
      thumb { nil }
      mime_type { nil }
    end
  end
end
