class CreateCares < ActiveRecord::Migration[7.0]
  def change
    create_table :cares do |t|
      t.string :description
      t.string :name

      t.timestamps
    end
  end
end
