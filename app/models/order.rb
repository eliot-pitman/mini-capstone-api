class Order < ApplicationRecord

  belongs_to :user

  has_many :carted_products
  has_many :products, through: :carted_products

  def updated_totals
    calculated_subtotal = 0
    cart.each do |product|
      calculated_subtotal += product.quantity * product.product.price
    end

    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    self.subtotal = calculated_subtotal
    self.tax = calculated_tax
    self.save
  end
  
end
