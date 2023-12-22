class Student < ApplicationRecord
  has_many :certificates, dependent: :destroy
end
