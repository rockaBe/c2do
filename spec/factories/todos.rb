# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :todo do
  	name "MyString"
    position 1

    shared_state "none"
    # progress_state "none"
    
    predue_at "2013-11-19 15:58:24"
    due_at "2013-11-20 15:58:24"
    overdue_at "2013-11-21 15:58:24"

    association :list
    association :creator_user, 	factory: (:user)
  end
end
