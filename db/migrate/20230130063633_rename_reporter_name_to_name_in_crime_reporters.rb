class RenameReporterNameToNameInCrimeReporters < ActiveRecord::Migration[7.0]
  def change
    rename_column :crime_reporters, :reporter_name, :name
  end
end
