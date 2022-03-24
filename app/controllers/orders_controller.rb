class OrdersController < ApplicationController

  before_action :authenticate_user

  def create
    product = Product.find_by(id: params[:product_id])

    calculated_subtotal = (product.price * params[:quantity]).round(2)
    calculated_tax = (calculated_subtotal * 0.09).round(2)
    calculated_total = (calculated_subtotal + calculated_tax).round(2)


    @orders = Order.new( 
    user_id: current_user.id, 
    product_id: params[:product_id], 
    quantity: params[:quantity], 
    subtotal: calculated_subtotal, 
    tax: calculated_tax, 
    total: calculated_total
  )
    @orders.save
    render :show
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
