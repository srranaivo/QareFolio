class ValidatedCare < ApplicationRecord
  belongs_to :consultation
  belongs_to :care
end
