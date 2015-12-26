# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attachment_document, class: TelegramBot::Model::Attachment::Document do
    file_id { Faker::Lorem.word }
    file_size { Faker::Number.number(10) }
    thumb { attributes_for :attachment_photo_size }
    file_name { Faker::Lorem.word }
    mime_type { ['application/pdf', 'text/html', 'application/oda', 'text/plain'].sample }

    factory :attachment_document_without_optional_fields do
      file_size { nil }
      thumb { nil }
      file_name { nil }
      mime_type { nil }
    end
  end
end
