class Todo < ActiveRecord::Base
	
	belongs_to :list
	has_many :tasks

  has_many :open_tasks, -> { where progress_state: 'open' }, class_name: "Task"

	belongs_to :creator_user, class_name: "User", foreign_key: "creator_user_id"
	belongs_to :assigned_user, class_name: "User", foreign_key: "assigned_user_id"

	validates_presence_of :list_id, :creator_user_id, :name
	validates :position, numericality: { greater_than_or_equal_to: 0 }
	# validates_numericality_of :list_id, :creator_user_id, :assigned_user_id

	STATES = %w(open urgent in_progress blocked delayed finished)

  include Concerns::ProgressState

	include RankedModel
  ranks :position
end
