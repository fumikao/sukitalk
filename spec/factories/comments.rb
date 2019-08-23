FactoryBot.define do
  factory :comment do
    content {"aaa"}
    association :user
    association :talk
  end
end