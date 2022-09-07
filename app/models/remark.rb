class Remark < ApplicationRecord
  belongs_to :consultation
  enum :tag, { important: 0, question: 1, observation: 2 }
  validates :title, presence: true
  validates :tag, presence: true
end
