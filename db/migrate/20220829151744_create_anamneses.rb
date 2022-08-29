class CreateAnamneses < ActiveRecord::Migration[7.0]
  def change
    create_table :anamneses do |t|
      t.references :patient, null: false, foreign_key: true
      t.date :date
      t.string :description

      t.timestamps
    end
  end
end
