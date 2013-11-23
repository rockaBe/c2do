# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :number do |n|
  	n+1
  end
end

FactoryGirl.define do
  factory :list_subscription do
    list  { |c| c.association(:list) }
    user  { |c| c.association(:user) }
  end
end
