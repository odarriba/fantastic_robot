# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chat, class: TelegramBot::Model::Chat do
    id { 7 }
  end
end
