FactoryBot.define do
  factory :message do
    association :room
    association :user
    message { "Hello World!" }
  end
end
