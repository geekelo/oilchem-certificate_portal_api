class Student < ApplicationRecord
  has_many :certificates, dependent: :destroy
  belongs_to :batch
end
