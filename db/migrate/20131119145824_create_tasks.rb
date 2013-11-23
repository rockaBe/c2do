class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :position
      
      t.string :progress_state
      t.string :shared_state
      
      t.datetime :predue_at
      t.datetime :overdue_at
      t.datetime :due_at
      
      t.timestamps
    end
  end
end
