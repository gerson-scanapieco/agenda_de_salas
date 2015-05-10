FactoryGirl.define do
  factory :reservation do
    
    trait :with_user do
      user
    end
  end

end
