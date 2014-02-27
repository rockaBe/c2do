# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sharing do
    user_id 1
    recipient_id 1
    description "MyText"
    shareable_id 1
  end
end
