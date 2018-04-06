class AddFullLocationToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :full_location, :string
  end
end
