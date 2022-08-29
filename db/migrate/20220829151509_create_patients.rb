class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.float :lat
      t.float :long
      t.string :adress

      t.timestamps
    end
  end
end
