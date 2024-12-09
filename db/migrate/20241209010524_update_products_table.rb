class UpdateProductsTable < ActiveRecord::Migration[8.0]
  def change
    # Agregar nuevas columnas
    add_column :products, :stock, :integer
    add_column :products, :deleted_at, :datetime

    # Modificar el tipo de la columna price
    change_column :products, :price, :float
  end
end
