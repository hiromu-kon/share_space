FactoryBot.define do
  factory :post do
    title { "MyString" }
    content { "MyText" }
    reward { 1 }
    recruit_people { 1 }
  end
end
