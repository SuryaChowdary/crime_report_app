class CreateCrime < ActiveRecord::Migration[6.1]
  def change
    create_table :crimes do |t|
      t.integer :city_id
      t.integer :locality_id
      t.string :name
      t.text :crime_description
      t.datetime :crime_time
      t.string :priority
      t.boolean :resolved
      t.timestamps
    end
  end
end
