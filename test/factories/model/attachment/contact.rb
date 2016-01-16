# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attachment_contact, class: TelegramBot::Model::Attachment::Contact do
    phone_number { Faker::Number.number(9) }
    user_id { Faker::Number.number(10) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    factory :attachment_contact_without_optional_fields do
      user_id { nil }
      last_name { nil }
    end
  end
end
