# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attachment_sticker, class: FantasticRobot::Model::Attachment::Sticker do
    file_id { Faker::Lorem.word }
    file_size { Faker::Number.number(10) }
    width { Faker::Number.number(3) }
    height { Faker::Number.number(3) }
    thumb { attributes_for :attachment_photo_size }

    factory :attachment_sticker_without_optional_fields do
      file_size { nil }
      thumb { nil }
    end
  end
end
