json.array!(@sharings) do |sharing|
  json.extract! sharing, :user_id, :recipient_id, :description, :shareable_id
  json.url sharing_url(sharing, format: :json)
end
