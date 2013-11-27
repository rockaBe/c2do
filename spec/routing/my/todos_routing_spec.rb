require "spec_helper"

describe My::TodosController do
  describe "routing" do

    # pay attention to shallow routing
    # #index, #new, #create are nested under list, the others aren't

    context "nested within list-scope" do

      before(:each) do 
        @list = FactoryGirl.create(:list)
      end

      it "routes to #index" do
        get("/my/lists/#{@list.id}/todos").should route_to("my/todos#index", list_id: @list.id.to_s)
      end

      it "routes to #new" do
        get("/my/lists/#{@list.id}/todos/new").should route_to("my/todos#new", list_id: @list.id.to_s)
      end

      it "routes to #create" do
        post("/my/lists/#{@list.id}/todos").should route_to("my/todos#create", list_id: @list.id.to_s)
      end

    end

    context "not nested within the list-scope" do 

      it "routes to #show" do
        get("/my/todos/1").should route_to("my/todos#show", :id => "1")
      end

      it "routes to #edit" do
       get("/my/todos/1/edit").should route_to("my/todos#edit", :id => "1")
      end

      it "routes to #update" do
        put("/my/todos/1").should route_to("my/todos#update", :id => "1")
      end

      it "routes to #destroy" do
        delete("/my/todos/1").should route_to("my/todos#destroy", :id => "1")
      end

    end

  end
end
