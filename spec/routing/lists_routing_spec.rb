require "spec_helper"

describe ListsController do
  describe "routing" do

    before(:each) do 
      @user = FactoryGirl.create(:user)
    end

    # pay attention to shallow routing
    # #index, #new, #create are nested under user, the others aren't

    # nested
    it "routes to #index" do  
      get("/lists").should route_to("lists#index")
    end

  end
end
