class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.text :description
      t.datetime :sale_date
      t.timestamps
    end
  end
end
