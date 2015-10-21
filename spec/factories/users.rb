FactoryGirl.define do
  factory :user do
    name "Example User"
    email { FFaker::Internet.email }
    password "foobar"
    password_confirmation "foobar"
  end

end
