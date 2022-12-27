class UpdateResolvedToFalseInCrimes < ActiveRecord::Migration[6.1]
  def change
    Crime.update_all(resolved: false)
  end
end
