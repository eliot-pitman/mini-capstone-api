class ProductsController < ApplicationController
  def index
    all_products = Product.all
    render json: all_products.as_json
  end

  def first
    first = Product.first
    render json: first.as_json  
  end

  def show
    product_id = params[:id]
    product = Product.find(product_id)
    render json: product.as_json
  end

  def create
    product = Product.new(
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"])
      
    product.save
    render json: product.as_json
  end

  def update
    product_id = params[:id]
    product = Product.find(product_id)

    product.name = params["name"] || product.name
    product.price = params["price"] || product.price
    product.image_url = params["image_url"] || product.image_url
    product.description = params["description"] || product.description

    product.save
    render json: product.as_json
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
