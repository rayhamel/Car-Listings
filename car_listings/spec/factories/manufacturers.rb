FactoryGirl.define do
  factory :manufacturer do
    sequence(:name) { |n| "DeLorean#{n}" }
    country "Northern Ireland"
  end
end
