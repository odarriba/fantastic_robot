# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :send_document, class: FantasticRobot::Request::SendDocument do
    chat_id { Faker::Number.number(10) }
    document { Faker::Lorem.word }
    reply_to_message_id { Faker::Number.number(10) }
    reply_markup { nil }

    factory :send_document_without_optional_fields do
      reply_to_message_id { nil }
      reply_markup { nil }
    end
  end
end
