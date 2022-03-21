class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  # def subtotal
  #   (quantity * price).round(2)
  # end
  
  # def tax
  #   (price.to_i * 0.09).round(2)
  # end

  # def total
  #   (subtotal.to_i + tax).round(2)
  # end

end
