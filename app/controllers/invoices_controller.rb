class InvoicesController < ApplicationController

	layout false

  def index
  	@invoices = Invoice.by_product_id
  end

  def create
  	@invoice = Invoice.new(invoice_params)
  	@product = Product.find(params[:product_id])
  	if @invoice.save
  		flash[:notice] = "Invoice created successfully."
  		redirect_to(action: "index")
  	else
  		flash[:notice] = "Whoops! Something went wrong."
  		render("products/show")
  	end
  end

  def destroy
  	invoice = Invoice.find(params[:id]).destroy
  	flash[:notice] = "Invoice destroyed successfully."
  	redirect_to(action: "index")
  end

  private

  def invoice_params
  	params.permit(:product_id)
  end
end
