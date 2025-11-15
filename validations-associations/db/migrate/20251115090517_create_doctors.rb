class CreateDoctors < ActiveRecord::Migration[7.1]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :gender
      t.string :specialty
      t.integer :age

      t.timestamps
    end

  end
end
