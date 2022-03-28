class CartedProductsController < ApplicationController
  before_action :authenticate_user
  
  def create
    carted_order = CartedProduct.new(
      user_id: current_user.id, 
      product_id: params[:product_id],
      status: params[:status] || "Carted",
      quantity: params[:quantity], 
      order_id: params[:order_id]
    )
    carted_order.save
    render json: carted_order.as_json
  end
  # def index

  #   user = current

  #   carted_products = CartedProduct.find_by(id: current_user.id)
  #   render json: carted_products.as_json
  # end
end
