json.array!(@lists) do |list|
  json.extract! list, :name, :position
  json.url list_url(list, format: :json)
end
