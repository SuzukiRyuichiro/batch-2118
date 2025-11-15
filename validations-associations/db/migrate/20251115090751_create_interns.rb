class CreateInterns < ActiveRecord::Migration[7.1]
  def change
    create_table :interns do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.references :doctor, foreign_key: true

      t.timestamps
    end
  end
end
