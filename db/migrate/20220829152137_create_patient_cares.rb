class CreatePatientCares < ActiveRecord::Migration[7.0]
  def change
    create_table :patient_cares do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :care, null: false, foreign_key: true

      t.timestamps
    end
  end
end
