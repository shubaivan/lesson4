class AddListsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :lists_users, primary_key: false do |t|
      t.integer :list_id
      t.integer :user_id
    end
    add_index :lists_users, [:list_id, :user_id]
  end
end
