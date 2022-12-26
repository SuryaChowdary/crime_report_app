class CreateLocality < ActiveRecord::Migration[6.1]
  def change
    create_table :localities do |t|
      t.string :street
      t.timestamps
    end
  end
end
