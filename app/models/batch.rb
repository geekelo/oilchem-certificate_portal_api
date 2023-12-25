# app/models/batch.rb
class Batch < ApplicationRecord
  has_many :students, dependent: :destroy
end
