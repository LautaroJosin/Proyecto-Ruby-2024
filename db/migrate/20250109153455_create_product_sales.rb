class CreateProductSales < ActiveRecord::Migration[8.0]
  def change
    create_table :product_sales do |t|
      t.references :sale, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :sale_price

      t.timestamps
    end
  end
end
