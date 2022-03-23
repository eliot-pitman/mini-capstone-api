class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

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
