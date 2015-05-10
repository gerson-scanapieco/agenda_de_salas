FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "user_#{n}" }
    sequence(:email) { |n| "user_#{n}@test.com" }
    password '12345678'
    password_confirmation '12345678'
  end

end
