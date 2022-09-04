class AddValidatedBooleanToConsultation < ActiveRecord::Migration[7.0]
  def change
    add_column :consultations, :validated, :boolean, default: false
  end
end
