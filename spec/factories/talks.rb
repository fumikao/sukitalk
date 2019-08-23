FactoryBot.define do
  factory :talk do
    content {"aaa"}
    association :user
    association :category
  end
end