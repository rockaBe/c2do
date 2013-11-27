require 'spec_helper'

describe ListSubscription do
  before(:each) do	
  	@attr = {
  		user_id: 			User.first.id,
  		list_id: 			List.first.id,
  		creator_id: 	User.first.id
  	}
  end
end
