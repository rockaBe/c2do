class CreateListSubscriptions < ActiveRecord::Migration
  def change
    create_table :list_subscriptions do |t|
      t.integer :list_id
      t.integer :user_id
      t.integer :creator_id

      t.timestamps
    end
  end
end
