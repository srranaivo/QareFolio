class AddConsultationIdForRemarks < ActiveRecord::Migration[7.0]
  def change
    add_reference :remarks, :consultation, foreign_key: true
  end
end
