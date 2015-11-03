FactoryGirl.define do
  factory :user do
    name "UserName"
    sequence(:email) { |n| "user#{n}@example.ru" }
  end

  factory :chat do
  end

  factory :message do
    text "message"
    user_id 1
    chat_id 1
  end

  factory :session do
    user_id 1
    token "first"
  end
end
