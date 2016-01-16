# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attachment_photo_size, class: FantasticRobot::Model::Attachment::PhotoSize do
    file_id { Faker::Lorem.word }
    file_size { Faker::Number.number(10) }
    width { Faker::Number.number(3) }
    height { Faker::Number.number(3) }

    factory :attachment_photo_size_without_optional_fields do
      file_size { nil }
    end
  end
end
