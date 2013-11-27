class AddsStateFieldsAndTimesToTodos < ActiveRecord::Migration
  def change
  	add_column :todos, :due_at, :datetime
  	add_column :todos, :predue_at, :datetime
  	add_column :todos, :overdue_at, :datetime

  	add_column :todos, :shared_state, :string, default: 'none'
  	add_column :todos, :progress_state, :string, default: 'none'
  end
end
