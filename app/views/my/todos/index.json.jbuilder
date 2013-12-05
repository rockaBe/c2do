json.array!(@todos) do |todo|
  json.extract! todo, :name, :position
  json.url my_list_todo_url(@list, todo, format: :json)
end
