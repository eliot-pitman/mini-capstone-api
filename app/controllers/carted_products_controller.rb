class CartedProductsController < ApplicationController
  before_action :authenticate_user
  
  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id, 
      product_id: params[:product_id],
      status: params[:status] || "Carted",
      quantity: params[:quantity], 
      order_id: params[:order_id]
    )
    carted_product.save
    render json: carted_order.as_json
  end
  def index


    cart = current_user.carted_products.where(status: "carted")
    render json: cart.as_json
  end
end
