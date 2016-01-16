# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :update, class: FantasticRobot::Model::Update do
    update_id { Faker::Number.number(10) }
    message { nil }

    factory :update_with_message do
      message { attributes_for :message }
    end
  end
end
