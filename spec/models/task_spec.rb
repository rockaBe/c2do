require 'spec_helper'

describe Task do
  before(:each) do	
  	@attr = {
  		name: 						'Task 1',
  		position: 				1,
  		progress_state: 	'none',
  		shared_state: 		'none', 
  		predue_at: 				2.hours.from_now,
  		due_at: 					12.hours.from.now,
  		overdue_at: 			24.hours.from_now
  	}

    it { should validate_presence_of :name }
    it { should validate_presence_of :creator_user_id }

  	it "should create a new instance given a valid attribute" do
  	  @task = Task.create!(@attr)
  	  @task.should be_valid
  	end
  end
end
