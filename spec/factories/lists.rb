# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :list do
    name "MyString"
    position 1

    factory :subscribed_list do
      before(:create) do |list|
        list_subscription = create(:list_subscription, list: list)
        create(:user, list_subscription: list_subscription)
      end
    end
  end
end
