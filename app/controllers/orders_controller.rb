class OrdersController < ApplicationController

  before_action :authenticate_user

  def create
    @orders = Order.new( 
    user_id: current_user.id 
    # product_id: params[:product_id], 
    # quantity: params[:quantity], 
    #   subtotal: calculated_subtotal, 
    #   tax: calculated_tax, 
    #   total: calculated_total
    )
    cart = current_user.carted_products.where(status: "carted")
    if @orders.save
      cart.update_all(status:"purchased", order_id: @orders.id)
      @orders.updated_totals
      render :show
    else
      render json: {message: "error"}
    end
  end 

  def index
    @orders = current_user.orders
    render :index
  end 

  def show
    @orders = current_user.orders.find_by(id: params[:id])
    render :show
  end
end
