FactoryGirl.define do
  factory :user do
    email       { FFaker::Internet.email }
    password    { FFaker::DizzleIpsum.words(4).join('!').first(20) }
    password_confirmation { password }
  end
end