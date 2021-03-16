FactoryBot.define do
  factory :host_user do
    name { "host_test" }
    email { "host_test@gmail.com" }
    password { "test123" }
    password_confirmation { "test123" }
    industry { "飲食" }
    average_age { 25 }
    introduction { "aaaa" }
    employee { 20 }
    prefectures { "北海道" }
  end
end
