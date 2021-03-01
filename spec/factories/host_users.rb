FactoryBot.define do
  factory :host_user do
    name { "host_test" }
    email { "host_test@gmail.com" }
    password { "test123" }
    password_confirmation { "test123" }
  end
end
