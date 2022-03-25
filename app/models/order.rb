class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  belongs_to :user

  has_many :carted_products

  # def calculated_subtotal
  #   product.price * params[:quantity]
  # end

  # def calculated_tax
  #   (calculated_subtotal * 0.09).round(2)
  # end
  
  # def calculated_total
  #   calculated_tax + calculated_subtotal
  # end
  
end
