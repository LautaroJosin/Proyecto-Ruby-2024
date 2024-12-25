class AddOldPasswordDigestToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :old_password_digest, :string, null: true
  end
end
