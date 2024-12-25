class AddStateToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :state, :boolean, default: true
  end
end
