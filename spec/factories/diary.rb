FactoryBot.define do
  factory :diary do
    body {Faker::Lorem.characters(number:100)}
    user_id {1}
  end
end