class AddForeignKeysAndIndicesToClasses < ActiveRecord::Migration
  def change

  # ADD COLUMNS
  # To TODOs:
  	add_column :todos, :list_id, :integer, null: false
  	add_column :todos, :creator_user_id, :integer, null: false
  	add_column :todos, :assigned_user_id, :integer
  # To TASKs:
  	add_column :tasks, :todo_id, :integer, null: false
  	add_column :tasks, :creator_user_id, :integer, null: false
  	add_column :tasks, :assigned_user_id, :integer
  
	# ADD INDEXES
  	# list_todos
  		add_index :todos, [:assigned_user_id, :list_id], name: 'list_todos_by_assigned_user_id'
  		add_index :todos, [:creator_user_id, :list_id], name: 'list_todos_by_creator_user_id'
  	# user_todos
  		add_index :todos, :creator_user_id
  		add_index :todos, :assigned_user_id
  # ADD INDEXES
  	# list- & todo_tasks
			add_index :tasks, [:id, :todo_id], name: 'tasks_by_todo_id'
		# user_tasks
			add_index :tasks, [:id, :creator_user_id], name: 'tasks_by_creator'				
			add_index :tasks, [:id, :assigned_user_id], name: 'tasks_by_assigned_user'
			add_index :tasks, [:id, :creator_user_id, :todo_id], name: 'todo_tasks_by_creator'				
			add_index :tasks, [:id, :assigned_user_id, :todo_id], name: 'todo_tasks_by_assigned_user'
	end
end
