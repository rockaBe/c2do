json.array!(@todos) do |todo|
  json.extract! todo, :name, :position
  json.url todo_url(todo, format: :json)
end
