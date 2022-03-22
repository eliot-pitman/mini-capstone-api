class OrdersController < ApplicationController
  def create

    if current_user 
      product = Product.find_by(id: params[:product_id])

      calculated_subtotal = product.price * params[:quantity]
      calculated_tax = (calculated_subtotal * 0.09).round(2)
      calculated_total = calculated_tax + calculated_subtotal

      @orders = Order.new(
        user_id: current_user.id,
        product_id: params["product_id"],
        quantity: params["quantity"],
        subtotal: calculated_subtotal,
        tax: calculated_tax,
        total: calculated_total
      )
    
      @orders.save
      render :show
    else
      render json: {message: "too bad"}
    end
  end 

  def index 
    if current_user
      @orders = Order.all
      render :index
    else 
      render json: [], status: :unauthorized
    end 

  end 

  def show
    if current_user
      @orders = Order.find_by(id: params[:id]) 
      render :show
    else
      render json: {message: "too bad"}
    end
  end
end
