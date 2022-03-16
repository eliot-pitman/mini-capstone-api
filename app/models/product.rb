class Product < ApplicationRecord

  validates :name, presence: true

  
  def is_discounted?
    if price.to_i < 10 
      return true
    else 
      return false
    end
  end
  def tax
    tax = price.to_i * 0.9
    return tax
  end
  def total
    tax = price.to_i * 0.9
    total = tax + price
    return total
  end
end
