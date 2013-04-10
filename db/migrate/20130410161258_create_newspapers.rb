class CreateNewspapers < ActiveRecord::Migration
  def change
    create_table :newspapers do |t|
      t.string :title, null: false
      t.integer :editor_id, null: false

      t.timestamps
    end
    add_index :newspapers, :editor_id
  end
end
