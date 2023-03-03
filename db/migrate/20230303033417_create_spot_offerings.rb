class CreateSpotOfferings < ActiveRecord::Migration[6.0]
  def change
    create_table :spot_offerings do |t|
      t.integer :spot_id
      t.integer :amenity_id

      t.timestamps
    end
  end
end
