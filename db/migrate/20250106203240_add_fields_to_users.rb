class AddFieldsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true

    add_column :users, :phone, :string
    add_column :users, :joined_at, :datetime
    add_column :users, :is_active, :boolean, default: true
  end
end
