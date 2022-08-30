class AddProgilPicToPatients < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :profile_pic, :string
  end
end
