require 'spec_helper'

describe ListsController do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @user.list_subscriptions.push(FactoryGirl.create(:list_subscription))
    @list = @user.lists.first
  end 

  let(:valid_session) { {  } }

  describe "GET index" do
    it "assigns all users lists as @lists" do
      controller.stub(:current_user).and_return @user
      get :index, { }, valid_session
      assigns(:lists).should eq([@list])
    end
  end

end
