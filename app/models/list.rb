class List < ActiveRecord::Base
	
	validates_presence_of :name, :position
	validates_numericality_of :position
	validates :position, numericality: { greater_than_or_equal_to: 0 }

	has_many :list_subscriptions
	has_many :users, through: :list_subscriptions

	has_many :todos
	has_many :todo_tasks, through: :todos, source: :tasks, class_name: "Task"

	has_many :open_todos, -> { where progress_state: 'open' }, class_name: "Todo"
	
	include RankedModel
	ranks :position
end
