# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :send_message, class: FantasticRobot::Request::SendMessage do
    chat_id { Faker::Number.number(10) }
    text { Faker::Lorem.sentence }
    parse_mode { "Markdown" }
    disable_web_page_preview { false }
    reply_to_message_id { Faker::Number.number(10) }
    reply_markup { nil }

    factory :send_message_without_optional_fields do
      parse_mode { nil }
      disable_web_page_preview { nil }
      reply_to_message_id { nil }
      reply_markup { nil }
    end
  end
end
