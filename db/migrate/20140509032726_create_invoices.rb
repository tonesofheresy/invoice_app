class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
    	t.references :product
      t.timestamps
    end
  end
end
