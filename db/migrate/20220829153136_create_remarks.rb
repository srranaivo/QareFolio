class CreateRemarks < ActiveRecord::Migration[7.0]
  def change
    create_table :remarks do |t|
      t.references :patient, null: false, foreign_key: true
      t.integer :tag
      t.string :description
      t.string :title

      t.timestamps
    end
  end
end
