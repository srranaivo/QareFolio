class ChangePatientAddress < ActiveRecord::Migration[7.0]
  def change
    rename_column :patients, :adress, :address
  end
end
