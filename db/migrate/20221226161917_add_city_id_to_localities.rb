class AddCityIdToLocalities < ActiveRecord::Migration[6.1]
  def change
    add_column :localities, :city_id , :int
  end
end
