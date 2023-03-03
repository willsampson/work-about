class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.time :hours
      t.string :traffic
      t.string :photo
      t.string :address
      t.integer :region_id

      t.timestamps
    end
  end
end
