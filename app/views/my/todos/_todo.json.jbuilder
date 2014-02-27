json.extract! todo, :name, :position, :shared_state, :progress_state, :id
json.created_at todo.created_at.to_s
json.updated_at todo.updated_at.to_s
json.due_at todo.due_at.to_s
json.update_state_url update_state_my_todo_path(todo)