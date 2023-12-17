class CreateTrainingpersonnels < ActiveRecord::Migration[7.1]
  def change
    create_table :trainingpersonnels do |t|
      t.string :name
      t.string :signature

      t.timestamps
    end
  end
end
