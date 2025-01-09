class CreateSales < ActiveRecord::Migration[8.0]
  def change
    create_table :sales do |t|
      t.datetime :date_time
      t.decimal :total_price
      t.references :user, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
