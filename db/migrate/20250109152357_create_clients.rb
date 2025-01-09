class CreateClients < ActiveRecord::Migration[8.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :lastname
      t.string :dni
      t.string :phone
      t.timestamps
    end
  end
end
