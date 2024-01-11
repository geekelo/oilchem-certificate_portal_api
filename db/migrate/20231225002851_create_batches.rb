class CreateBatches < ActiveRecord::Migration[7.1]
  def change
    create_table :batches do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.timestamps
    end

    add_reference :students, :batch, foreign_key: true
  end
end
