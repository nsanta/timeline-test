FactoryBot.define do
  factory :tweet do
    sequence :message do |n|
      "Tweet message #{n}"
    end
    owner { create(:user) }
  end
end
