class Task < ActiveRecord::Base

	belongs_to :todo
	belongs_to :creator_user, class_name: "User", foreign_key: "creator_user_id"
	belongs_to :assigned_user, class_name: "User", foreign_key: "assigned_user_id"
	
	delegate :list, to: :todo, allow_nil: true

	validates_presence_of :name, :creator_user_id
	validates :position, numericality: { greater_than_or_equal_to: 0 }

  include RankedModel
  ranks :position
end
