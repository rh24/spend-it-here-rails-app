class AddLocationIdColumnToBusinesses < ActiveRecord::Migration[5.1]
  def change
    add_column :businesses, :location_id, :integer
  end
end
