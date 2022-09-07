class DeletePatientIdForRemarks < ActiveRecord::Migration[7.0]
  def change
    remove_column :remarks, :patient_id
  end
end
