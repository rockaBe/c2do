require "spec_helper"

describe My::TasksController do
  describe "routing" do

    let(:prefix) { "my" }
    let(:todo) { FactoryGirl.create(:todo) } 

    it "routes to #index" do
      get("/#{prefix}/todos/#{todo.id}/tasks").should route_to("my/tasks#index", todo_id: todo.id.to_s)
    end

    it "routes to #new" do
      get("/#{prefix}/todos/#{todo.id}/tasks/new").should route_to("my/tasks#new", todo_id: todo.id.to_s)
    end

    it "routes to #create" do
      post("/#{prefix}/todos/#{todo.id}/tasks").should route_to("my/tasks#create", todo_id: todo.id.to_s)
    end

    it "routes to #show" do
      get("/#{prefix}/tasks/1").should route_to("my/tasks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/#{prefix}/tasks/1/edit").should route_to("my/tasks#edit", :id => "1")
    end

    it "routes to #update" do
      put("/#{prefix}/tasks/1").should route_to("my/tasks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/#{prefix}/tasks/1").should route_to("my/tasks#destroy", :id => "1")
    end

  end
end
