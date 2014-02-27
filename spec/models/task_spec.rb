require 'spec_helper'

describe Task do
  before(:each) do	
  	@attr = {
  		name: 						'Task 1',
  		position: 				1,
  		progress_state: 	'none',
  		shared_state: 		:open, 
  		predue_at: 				2.hours.from_now,
  		due_at: 					12.hours.from_now,
  		overdue_at: 			24.hours.from_now,
      creator_user_id:  1
  	}
  end

  it { should validate_presence_of :name }
  it { should validate_presence_of :creator_user_id }
  it { should validate_numericality_of(:position).is_greater_than_or_equal_to(0) }

  it "should create a new instance given a valid attribute" do
    @task = FactoryGirl.create(:task)
    @task.should be_valid
  end
end
