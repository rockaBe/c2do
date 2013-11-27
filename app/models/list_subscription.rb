class ListSubscription < ActiveRecord::Base
	validates_presence_of :user_id, :list_id

	belongs_to :user
	belongs_to :list

end
