class CreateCity < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|

      t.timestamps
    end
  end
end
