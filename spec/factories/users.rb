# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	sequence :email do |n|
    	"person#{n}@example.com"
  	end
    sequence :name do |n|
    "Test User #{n}"
  	end
    sequence :password do |n| 
    	"password#{n}"
    end
    password_confirmation {|n| n.password}
    # required if the Devise Confirmable module is used
    confirmed_at Time.now

    factory :user_with_list do |user|
      user.lists { |lists| [lists.association(:list_subscription)] }
    end
  end
end
