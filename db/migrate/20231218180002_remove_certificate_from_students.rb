class RemoveCertificateFromStudents < ActiveRecord::Migration[7.1]
  def change
    remove_reference :students, :certificate, foreign_key: true
  end
end
