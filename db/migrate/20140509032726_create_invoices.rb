class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
    	t.references :product
    	t.string :name
    	t.decimal :subtotal, precision: 5, scale: 2
    	t.decimal :tax, precision: 3, scale: 1
    	t.decimal :total, precision: 5, scale: 2
      t.timestamps
    end
  end
end
