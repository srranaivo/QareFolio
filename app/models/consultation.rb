class Consultation < ApplicationRecord
  belongs_to :tour
  belongs_to :patient
end
