class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone
      t.string :password_digest, null: false
      t.references :role, null: false, foreign_key: true # foreign key
      t.date :join_date, null: false

      t.timestamps
    end

    add_index :users, :name, unique: true
    add_index :users, :email, unique: true
  end
end