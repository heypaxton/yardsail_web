class AddSaleTypeToSales < ActiveRecord::Migration
  def change
    add_column :sales, :sale_type, :string
  end
end
