# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :send_chat_action, class: TelegramBot::Request::SendChatAction do
    chat_id { Faker::Number.number(10) }
    action { TelegramBot::Request::SendChatAction::VALID_ACTIONS.sample }

    factory :send_chat_action_without_optional_fields do
    end
  end
end
