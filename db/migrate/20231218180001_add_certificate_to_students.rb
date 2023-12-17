class AddCertificateToStudents < ActiveRecord::Migration[7.1]
  def change
    add_reference :students, :certificate, null: false, foreign_key: true
  end
end
