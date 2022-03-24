class Product < ApplicationRecord
  
  validates :name, presence: true
  validates :supplier_id, presence: true

  belongs_to :supplier

  has_many :orders
  has_many :images
  
  has_many :category_products
  has_many :categories, through: :category_products
  
  
  
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
