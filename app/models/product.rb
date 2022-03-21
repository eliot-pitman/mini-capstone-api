class Product < ApplicationRecord
  
  validates :name, presence: true
  validates :supplier_id, presence: true

  belongs_to :order
 
  has_many :images
  # def images
  #   Image.where(product_id: id)
  # end

  belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end
  
  def is_discounted?
    if price.to_i < 10 
      return true
    else 
      return false
    end
  end

  def tax
    (price.to_i * 0.09).round(2)
  end

  def total
    (price.to_i + tax).round(2)
  end
end
