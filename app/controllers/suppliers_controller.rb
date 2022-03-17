class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render :index
  end
  def show
    id = params[:id]
    @supplier = Supplier.find(id)
    render :show
  end
end
