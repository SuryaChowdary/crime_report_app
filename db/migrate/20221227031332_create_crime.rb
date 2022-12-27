class CreateCrime < ActiveRecord::Migration[6.1]
  def change
    create_table :crimes do |t|
      t.belongs_to :locality
      t.belongs_to :city
      t.string  :name
      t.text    :crime_description
      t.datetime :crime_time
      t.string  :priority
      t.boolean :resolved
      t.timestamps
    end
  end
end
