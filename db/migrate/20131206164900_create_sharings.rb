class CreateSharings < ActiveRecord::Migration
  def change
    create_table :sharings do |t|
      t.text :description
      t.references :shareable, :polymorphic => true
      t.references :user
      t.references :recipient
      
      t.timestamps
    end

    add_index(:sharings, :user_id)
    add_index(:sharings, [ :user_id, :shareable_type, :shareable_id ])
    add_index(:sharings, :recipient_id)

  end
end
