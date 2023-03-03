class CreateAmenities < ActiveRecord::Migration[6.0]
  def change
    create_table :amenities do |t|
      t.string :outlets
      t.boolean :coffee
      t.boolean :food
      t.boolean :wifi
      t.string :transit_access
      t.string :seating
      t.string :noise
      t.integer :spot_id

      t.timestamps
    end
  end
end
