class RemoveColumnFromLocations < ActiveRecord::Migration[5.1]
  def change
    remove_column :locations, :full_location, :string
  end
end
