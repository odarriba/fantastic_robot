# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :get_me, class: FantasticRobot::Request::GetMe do
    factory :get_me_without_optional_fields do
    end
  end
end
