class CreateCertificates < ActiveRecord::Migration[7.1]
  def change
    create_table :certificates do |t|
      t.string :name
      t.string :title
      t.string :course
      t.string :purpose
      t.references :student, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.references :training_director, foreign_key: { to_table: :trainingpersonnels }
      t.references :training_instructor, foreign_key: { to_table: :trainingpersonnels }
      t.references :external_facilitator, foreign_key: { to_table: :trainingpersonnels }

      t.timestamps
    end
  end
end
