class ProductsController < ApplicationController
  def all
    all_products = Product.all
    render json:(all_products.as_json)
  end

  def first
    first = Product.first
    render json:(first.as_json)  
  end

  def product1
    product = Product.find_by(id:1)
    render json:(product.as_json)
  end

  def product2
    product = Product.find_by(id:2)
    render json:(product.as_json)
  end

end
