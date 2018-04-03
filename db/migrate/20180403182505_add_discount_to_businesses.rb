class AddDiscountToBusinesses < ActiveRecord::Migration[5.1]
  def change
    add_column :businesses, :discount_offered, :boolean, default: false
  end
end
