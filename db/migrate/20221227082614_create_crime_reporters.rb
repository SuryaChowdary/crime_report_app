class CreateCrimeReporters < ActiveRecord::Migration[6.1]
  def change
    create_table :crime_reporters do |t|
      t.string :reporter_name
      t.string :phone
      t.string  :gender
      t.string  :email
      t.timestamps
    end
  end
end
