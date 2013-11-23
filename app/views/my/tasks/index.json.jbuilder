json.array!(@tasks) do |task|
  json.extract! task, :name, :position, :due_at, :shared_state, :progress_state, :shared_state, :predue_at, :overdue_at
  json.url task_url(task, format: :json)
end
