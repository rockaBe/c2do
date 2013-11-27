require 'spec_helper'

describe "Tasks" do
  describe "GET /tasks" do
  	let(:user) { FactoryGirl.create(:user) }
  	let(:todo) { FactoryGirl.create(:todo) } 
  	let(:task) { FactoryGirl.create(:task) }
    # it "works! (now write some real specs)" do
    #   # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    #   get my_todo_tasks_path(todo)
    #   response.status.should be(200)
    # end
  end
end
