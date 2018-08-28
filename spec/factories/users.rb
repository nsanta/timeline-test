FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password "123123"
    password_confirmation { "123123" }
  end
end
