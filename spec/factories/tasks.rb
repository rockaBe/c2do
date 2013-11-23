# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    name "MyString"
    position 1
    
    shared_state "MyString"
    progress_state "MyString"
    
    predue_at "2013-11-19 15:58:24"
    due_at "2013-11-20 15:58:24"
    overdue_at "2013-11-21 15:58:24"

    association :todo
    association :creator_user, factory: :user

  end
end
