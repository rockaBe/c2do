class AddIndixesAndDescriptionFieldsToTodosAndTasks < ActiveRecord::Migration
  def change
    # tasks
    add_column :tasks, :description, :text
    add_index(:tasks, :todo_id)
    add_index(:tasks, [ :todo_id, :description ], length: {list_id: 4, description: 15})

    # todos
    add_column :todos, :description, :text
    add_index(:todos, :list_id)
    add_index(:todos, [ :list_id, :description ], length: {list_id: 4, description: 15})
  end
end
