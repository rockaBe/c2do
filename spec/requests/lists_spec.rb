require 'spec_helper'

describe "Lists" do
	before(:each) do
		@user = FactoryGirl.create(:user)
		@list = FactoryGirl.create(:list)
	end
  describe "GET /lists" do
    # it "works! (now write some real specs)" do
    #   # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    #   get user_lists_path(@user)
    #   response.status.should be(200)
    # end
  end
end
