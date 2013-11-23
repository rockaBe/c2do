class Todo < ActiveRecord::Base
	
	belongs_to :list
	has_many :tasks

	belongs_to :creator_user, class_name: "User", foreign_key: "creator_user_id"
	belongs_to :assigned_user, class_name: "User", foreign_key: "assigned_user_id"

	validates_presence_of :list_id, :creator_user_id, :name
	# validates_numericality_of :list_id, :creator_user_id, :assigned_user_id

end
