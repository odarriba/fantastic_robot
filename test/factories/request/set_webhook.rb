# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :set_webhook, class: FantasticRobot::Request::SetWebhook do
    url { "https://#{Faker::Internet.domain_name}" }

    factory :set_webhook_without_optional_fields do
    end
  end
end
