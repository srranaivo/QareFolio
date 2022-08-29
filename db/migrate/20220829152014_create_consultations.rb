class CreateConsultations < ActiveRecord::Migration[7.0]
  def change
    create_table :consultations do |t|
      t.references :tour, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.datetime :end_date
      t.integer :position

      t.timestamps
    end
  end
end
