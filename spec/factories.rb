FactoryBot.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :contact do
    sequence(:name) {|n| "test_contact_#{n}" }
    email { FactoryBot.generate(:email) }
  end
end
