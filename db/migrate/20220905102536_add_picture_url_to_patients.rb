class AddPictureUrlToPatients < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :picture_url, :string
  end
end
