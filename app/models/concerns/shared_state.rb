module Concerns::SharedState
  extend ActiveSupport::Concern

  included do
    state_machine :shared_state, :initial => :none do
      # events 
      event :share do
        transition [:none, :rejected] => :in_sharing
      end
  
      event :accept_share do
        transition [:in_sharing] => :shared
      end
  
      event :reject_share do
        transition [:in_sharing] => :rejected
      end

      event :unbind_share do
        transition [:shared] => :none
      end

      before_transition [:none, :rejected] => :in_sharing do |shareable, transition|
        # create list_subscription for shared user
        # setup notification for user
        Logger.new(STDOUT).info ">>>>>>>>\nshareable :: #{shareable}\ntransition :: #{transition}\n>>>>>>>>"
        binding.pry
      end
    end
  end

end