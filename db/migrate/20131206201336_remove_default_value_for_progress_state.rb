class RemoveDefaultValueForProgressState < ActiveRecord::Migration
  def change
    change_column_default(:todos, :progress_state, nil)
    change_column_default(:tasks, :progress_state, nil)
  end
end
