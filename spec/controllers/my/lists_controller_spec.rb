require 'spec_helper'

describe My::ListsController do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @user.list_subscriptions.push(FactoryGirl.create(:list_subscription))
    @list = @user.lists.first
    sign_in @user
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ListsController. Be sure to keep this updated too.
  let(:valid_session) { {  } }

  describe "GET index" do
    it "assigns all users lists as @lists" do
      get :index, { }, valid_session
      assigns(:lists).should eq([@list])
    end
  end

  describe "GET show" do
    it "assigns the requested list as @list" do
      get :show, {id: @list.to_param}, valid_session
      assigns(:list).should eq(@list)
    end
  end

  describe "GET new" do
    it "assigns a new list as @list" do
      get :new, {}, valid_session
      assigns(:list).should be_a_new(List)
    end
  end

  describe "GET edit" do
    it "assigns the requested list as @list" do
      get :edit, {:id => @list.to_param}, valid_session
      assigns(:list).should eq(@list)
    end
  end

  describe "POST create", tag: :wip do
    describe "with valid params" do
      it "creates a new List" do
        expect {
          post :create, {:list => FactoryGirl.attributes_for(:list), user: @user}, valid_session
        }.to change(List, :count).by(1)
      end

      it "assigns a newly created list as @list" do
        post :create, {:list => FactoryGirl.attributes_for(:list)}, valid_session
        assigns(:list).should be_a(List)
        assigns(:list).should be_persisted
      end

      it "redirects to the created list" do
        post :create, {:list => FactoryGirl.attributes_for(:list)}, valid_session
        response.should redirect_to([:my, List.unscoped.last])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved list as @list" do
        # Trigger the behavior that occurs when invalid params are submitted
        List.any_instance.stub(:save).and_return(false)
        post :create, {:list => { "name" => "invalid value" }}, valid_session
        assigns(:list).should be_a_new(List)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        List.any_instance.stub(:save).and_return(false)
        post :create, {:list => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "POST sort" do
    it "updates the relevant position fields" do
      5.times { FactoryGirl.create(:list) }
      post :sort, { :list => [1,4,3,2,5] }, valid_session
      response.should be_success 
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested list" do
        # Assuming there are no other lists in the database, this
        # specifies that the List created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        List.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => @list.to_param, :list => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested list as @list" do
        put :update, {:id => @list.to_param, :list => FactoryGirl.attributes_for(:list)}, valid_session
        assigns(:list).should eq(@list)
      end

      it "redirects to the list" do
        put :update, {:id => @list.to_param, :list => FactoryGirl.attributes_for(:list)}, valid_session
        response.should redirect_to([:my, @list])
      end
    end

    describe "with invalid params" do
      it "assigns the list as @list" do
        # Trigger the behavior that occurs when invalid params are submitted
        List.any_instance.stub(:save).and_return(false)
        put :update, {:id => @list.to_param, :list => { "name" => "invalid value" }}, valid_session
        assigns(:list).should eq(@list)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        List.any_instance.stub(:save).and_return(false)
        put :update, {:id => @list.to_param, :list => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested list" do
      expect {
        delete :destroy, {:id => @list.to_param}, valid_session
      }.to change(List, :count).by(-1)
    end

    it "redirects to the lists list" do
      delete :destroy, {:id => @list.to_param}, valid_session
      response.should redirect_to(my_lists_url)
    end
  end

end
