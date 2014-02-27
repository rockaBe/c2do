require 'spec_helper'

describe Concerns::ProgressState do

  let(:todo) { FactoryGirl.create(:todo) }

  it "is :open initially" do
    todo.should be_open
  end

  it "is :in_progress after #start" do
    todo.start
    todo.should be_in_progress
  end

  it "is :urgent after #alert" do
    todo.alert
    todo.should be_urgent
  end

  it "is :delayed after delay" do
    todo.delay
    todo.should be_delayed
  end

  it "is :finished after #finish" do
    todo.finish
    todo.should be_finished
  end

  it "is :blocked after #block" do
    todo.block
    todo.should be_blocked
  end

  it "should not be possible to transition from :finished to :delayed" do
    todo.finish
    todo.delay
    todo.should_not be_delayed
  end

  it "should not be possible to transition from :urgent to :in_progress" do
    todo.finish
    todo.start
    todo.should_not be_in_progress
  end

  it "should not be possible to transition from :finished to :blocked" do
    todo.finish
    todo.block
    todo.should_not be_blocked
  end

end