FactoryGirl.define do
  factory :user do
    sequence(:email) {|i| "instructor#{i}@test.com" }
    password 'password'
    confirmed_at Time.now
  end
end

