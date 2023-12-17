class Certificate < ApplicationRecord
  has_many :students, dependent: :destroy
  has_many :trainingpersonnels
end
