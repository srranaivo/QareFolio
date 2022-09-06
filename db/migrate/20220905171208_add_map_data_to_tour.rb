class AddMapDataToTour < ActiveRecord::Migration[7.0]
  def change
    add_column :tours, :map_data, :jsonb, default: '{}'
  end
end
