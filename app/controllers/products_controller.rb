class ProductsController < ApplicationController

	layout false

  def new
  	@product = Product.new(price: 0.00)
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
  		flash[:notice] = "Product created successfully."
  		redirect_to(action: "index")
  	else
  		render("new")
  	end
  end

  def index
  	@products = Product.cheapest_first
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def update
  	@product = Product.find(params[:id])
  	if @product.update_attributes(product_params)
  		flash[:notice] = "Product updated successfully."
  		redirect_to(action: "index")
  	else
  		render("edit")
  	end
  end

  def delete
  	@product = Product.find(params[:id])
  end

  def destroy
  	product = Product.find(params[:id]).destroy
  	flash[:notice] = "Product deleted successfully."
  	redirect_to(action: "index")
  end

  private

  def product_params
  	params.require(:product).permit(:price, :name)
  end

end
