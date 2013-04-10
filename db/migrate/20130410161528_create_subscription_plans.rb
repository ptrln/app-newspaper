class CreateSubscriptionPlans < ActiveRecord::Migration
  def change
    create_table :subscription_plans do |t|
      t.boolean :is_daily, null: false
      t.integer :newspaper_id, null: false
      t.decimal :price, null: false, :precision => 8, :scale => 2

      t.timestamps
    end

    add_index :subscription_plans, :newspaper_id
  end
end
