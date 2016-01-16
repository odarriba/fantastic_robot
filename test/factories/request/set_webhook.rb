# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :set_webhook, class: TelegramBot::Request::SetWebhook do
    url { "https://#{Faker::Internet.domain_name}" }

    factory :set_webhook_without_optional_fields do
    end
  end
end
