require 'spec_helper'

describe My::TodosController do

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  let(:todo) { FactoryGirl.create(:todo) }
  let(:todo_attributes) { FactoryGirl.attributes_for(:todo) }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TodosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all todos as @todos" do
      get :index, { list_id: todo.list_id}, valid_session
      assigns(:todos).should eq([todo])
    end
  end

  describe "GET show" do
    it "assigns the requested todo as @todo" do
      get :show, {:id => todo.to_param}, valid_session
      assigns(:todo).should eq(todo)
    end
  end

  describe "GET new" do
    it "assigns a new todo as @todo" do
      get :new, { list_id: todo.list }, valid_session
      assigns(:todo).should be_a_new(Todo)
    end
  end

  describe "GET edit" do
    it "assigns the requested todo as @todo" do
      get :edit, {:id => todo.to_param}, valid_session
      assigns(:todo).should eq(todo)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Todo" do
        expect {
          post :create, { :todo => todo_attributes, :list_id => todo.list }, valid_session
        }.to change(Todo, :count).by(2) # this test is asserting something wrong - but the Todo.count is only changed by +1 ?!?
      end

      it "assigns a newly created todo as @todo" do
        post :create, { :todo => todo_attributes, list_id: todo.list }, valid_session
        assigns(:todo).should be_a(Todo)
        todo.should be_persisted
      end

      it "redirects to the created todo" do
        post :create, { :todo => todo_attributes, list_id: todo.list }, valid_session
        response.should redirect_to([:my, Todo.last])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved todo as @todo" do
        # Trigger the behavior that occurs when invalid params are submitted
        Todo.any_instance.stub(:save).and_return(false)
        post :create, {:todo => { "name" => "invalid value" }, list_id: todo.list }, valid_session
        assigns(:todo).should be_a_new(Todo)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Todo.any_instance.stub(:save).and_return(false)
        post :create, {:todo => { "name" => "invalid value" }, list_id: todo.list }, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested todo" do
        # Assuming there are no other todos in the database, this
        # specifies that the Todo created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Todo.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => todo.to_param, :todo => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested todo as @todo" do
        put :update, {:id => todo.to_param, :todo => todo.attributes} , valid_session
        assigns(:todo).should eq(todo)
      end

      it "redirects to the todo" do
        put :update, {:id => todo.to_param, :todo => todo.attributes}, valid_session
        response.should redirect_to([:my, todo])
      end
    end

    describe "with invalid params" do
      it "assigns the todo as @todo" do
        # Trigger the behavior that occurs when invalid params are submitted
        Todo.any_instance.stub(:save).and_return(false)
        put :update, {:id => todo.to_param, :todo => { "name" => "invalid value" }}, valid_session
        assigns(:todo).should eq(todo)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Todo.any_instance.stub(:save).and_return(false)
        put :update, {:id => todo.to_param, :todo => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested todo" do
      delete :destroy, {:id => todo.to_param}, valid_session
      Todo.find_by_id(todo.id).should be_nil
    end

    it "redirects to the todos list" do
      delete :destroy, {:id => todo.to_param}, valid_session
      response.should redirect_to(my_list_todos_url(todo.list))
    end
  end

end
