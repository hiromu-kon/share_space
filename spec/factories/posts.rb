FactoryBot.define do
  factory :post do
    title { "MyString" }
    content { "MyText" }
    reward { 1 }
    recruit_people { 1 }
    start_date { "2021-03-14" }
    finish_date { "2021-03-14" }
    association :user
  end
end
