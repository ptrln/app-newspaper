class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id, null: false
      t.integer :subscription_plan_id, null: false

      t.timestamps
    end
    add_index :subscriptions, :user_id
    add_index :subscriptions, :subscription_plan_id
  end
end
