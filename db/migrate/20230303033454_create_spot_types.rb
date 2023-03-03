class CreateSpotTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :spot_types do |t|
      t.integer :spot_id
      t.integer :category_id

      t.timestamps
    end
  end
end
