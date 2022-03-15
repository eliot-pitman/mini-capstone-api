class Product < ApplicationRecord
  def is_discounted?
    if price < 10 
      return true
    else 
      return false
    end
  end
  def tax
    tax = price * 0.9
    return tax
  end
  def total
    tax = price * 0.9
    total = tax + price
    return total
  end
end
