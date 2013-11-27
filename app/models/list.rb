class List < ActiveRecord::Base
	
	validates_presence_of :name, :position
	validates_numericality_of :position

	has_many :list_subscriptions
	has_many :users, through: :list_subscriptions

	has_many :todos
	has_many :todo_tasks, through: :todos, source: :tasks, class_name: "Task"
	
end
