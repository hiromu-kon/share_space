FactoryBot.define do
  factory :call_center_user do
    name { "call_center_test" }
    email { "call_center_test@gmail.com" }
    password { "test123" }
    password_confirmation { "test123" }
  end
end
