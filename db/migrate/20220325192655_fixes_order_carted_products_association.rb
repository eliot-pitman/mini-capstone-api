class FixesOrderCartedProductsAssociation < ActiveRecord::Migration[7.0]
  def change
    remove_column :carted_products, :order_id, :integer, optional: true
    add_column :carted_products, :order_id, :integer
  end
end
