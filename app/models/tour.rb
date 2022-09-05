class Tour < ApplicationRecord
  belongs_to :user
  has_many :consultations

  def is_finished?
    consultations.all? { |c| c.validated}
  end

  def pending_consultations
    consultations.where(validated: false).count
  end
end
