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

  factory :another_user, class: User do
    name { "another" }
    email { "another@gmail.com" }
    password { "password" }
  end

  factory :admin, class: User do
    name { "admin" }
    email { "admin@gmail.com" }
    password { "password" }
    admin { true }
  end
end
