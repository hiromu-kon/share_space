FactoryBot.define do
  factory :user do
    name { "test" }
    email { "test@gmail.com" }
    password { "test123" }
    password_confirmation { "test123" }
    industry { "飲食" }
    average_age { 25 }
    introduction { "aaaa" }
    employee { 20 }
    prefectures { "北海道" }
  end
end
