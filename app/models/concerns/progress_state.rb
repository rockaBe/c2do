module Concerns::ProgressState
  extend ActiveSupport::Concern

  # all states: 
  # [:open, :in_progress, :blocked, :urgent, :delayed, :finished]

  included do
    state_machine :progress_state, :initial => :open do
      # events 
      event :start do
        transition [:open, :in_progress, :delayed] => :in_progress
      end
  
      event :alert do
        transition [:open, :in_progress, :blocked] => :urgent
      end

      event :block do
        transition [:open, :in_progress, :delayed] => :blocked
      end
  
      event :delay do
        transition all - [:delayed, :finished] => :delayed
      end

      event :finish do
        transition all - [:finished] => :finished
      end
    end
  end

end