class CreateValidatedCares < ActiveRecord::Migration[7.0]
  def change
    create_table :validated_cares do |t|
      t.references :consultation, null: false, foreign_key: true
      t.references :care, null: false, foreign_key: true

      t.timestamps
    end
  end
end
