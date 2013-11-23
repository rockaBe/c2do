require 'spec_helper'

describe List do

  # attribute validations
  it { should validate_presence_of :name }
  it { should validate_presence_of :position }
  it { should validate_numericality_of :position }

  # association validations
  it { should have_many(:list_subscriptions) }
  it { should have_many(:users).through(:list_subscriptions)}
  it { should have_many(:todos) }
  it { should have_many(:todo_tasks).through(:todos)}

  it "should create a new instance given a valid attribute" do
  	FactoryGirl.create(:list) 
  end

  it "should validate a referenced user" do
    list = FactoryGirl.create(:list)
    list.users.should_not be(nil)
  end
  
end
