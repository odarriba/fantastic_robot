# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :forward_message, class: FantasticRobot::Request::ForwardMessage do
    chat_id { Faker::Number.number(10) }
    from_chat_id { Faker::Number.number(10) }
    message_id { Faker::Number.number(10) }
    disable_web_page_preview { false }
    reply_to_message_id { Faker::Number.number(10) }
    reply_markup { nil }

    factory :forward_message_without_optional_fields do
      disable_web_page_preview { nil }
      reply_to_message_id { nil }
      reply_markup { nil }
    end
  end
end
