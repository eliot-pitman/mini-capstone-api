class ProductsController < ApplicationController
  def index
    @products = Product.all
    render :index
  end

  def show
    @product = Product.find_by(id: params[:id]) || @product = Product.find_by(supplier_id: params[:id])
    render template: "products/show"
  end

  def create
    @product = Product.new(
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"],
      supplier_id: params["supplier_id"])
      
    if @product.save
      render :show
    else
      render json: {errors: @product.errors.full_message}, status: 422
    end
  end

  def update
    product_id = params[:id]
    @product = Product.find(product_id)

    @product.name = params["name"] || @product.name
    @product.price = params["price"] || @product.price
    @product.image_url = params["image_url"] || @product.image_url
    @product.description = params["description"] || @product.description
    @product.supplier_id = params["supplier_id"] || @product.supplier_id
    if @product.save
      render json: @product.as_json
    else 
      render json: {errors: @product.errors.full_message}
    end


  end

  def destroy
    product_id = params[:id]
    product = Product.find(product_id)
  
    product.destroy
    render json: {message: "deleted"}
  end
  

  # def show_product
  #   input = params["product"].strip.downcase
  #   product_result = Product.find_by(name:"#{input}")
  #   render json: product_result.as_json
  # end



end
