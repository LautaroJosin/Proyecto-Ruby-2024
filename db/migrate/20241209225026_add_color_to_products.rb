class AddColorToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :color, :string
  end
end
