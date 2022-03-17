class Product < ApplicationRecord

  validates :name, presence: true
  validates :supplier_id, presence: true

  def supplier
    Supplier.find_by(id: supplier_id)
  end
  
  def is_discounted?
    if price.to_i < 10 
      return true
    else 
      return false
    end
  end

  def tax
    price.to_i * 0.09
  end
  
  def total
    price.to_i + tax
  end
end
