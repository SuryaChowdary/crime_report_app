class AddCrimeReporterIdToCrimes < ActiveRecord::Migration[6.1]
  def change
    add_column :crimes, :crime_reporter_id, :int
  end
end
