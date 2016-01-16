# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :get_me, class: TelegramBot::Request::GetMe do
    factory :get_me_without_optional_fields do
    end
  end
end
