# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :file, class: FantasticRobot::Model::File do
    file_id { Faker::Number.number(10) }
    file_size { Faker::Number.number(10) }
    file_path { Faker::Lorem.word }

    factory :file_without_optional_fields do
      file_size { nil }
      file_path { nil }
    end
  end
end
