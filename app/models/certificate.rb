class Certificate < ApplicationRecord
  belongs_to :student, dependent: :destroy
  has_many :trainingpersonnels
end
