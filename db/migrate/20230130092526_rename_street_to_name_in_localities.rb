class RenameStreetToNameInLocalities < ActiveRecord::Migration[7.0]
  def change
    rename_column :localities, :street, :name
  end
end
