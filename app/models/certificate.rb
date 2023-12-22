class Certificate < ApplicationRecord
  belongs_to :student
  has_many :trainingpersonnels
end
