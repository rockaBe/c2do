class Task < ActiveRecord::Base

	belongs_to :todo
	belongs_to :creator_user, class_name: "User", foreign_key: "creator_user_id"
	belongs_to :assigned_user, class_name: "User", foreign_key: "assigned_user_id"
	
	delegate :list, to: :todo, allow_nil: true

	validates_presence_of :name, :creator_user

	default_scope { order( position: :asc ) }

end
