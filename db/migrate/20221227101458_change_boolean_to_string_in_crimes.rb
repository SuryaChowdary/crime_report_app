class ChangeBooleanToStringInCrimes < ActiveRecord::Migration[6.1]
  def change
    change_column :crimes, :resolved , :string
  end
end
