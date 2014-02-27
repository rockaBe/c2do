json.extract! @list, :name, :position, :id
json.created_at @list.created_at.to_s
json.updated_at @list.updated_at.to_s
json.todos do
	if @todos.empty?
		json.nil!
	else
		json.partial! "my/todos/todo", collection: @todos, as: :todo
	end
end
