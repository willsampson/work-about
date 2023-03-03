class CreateRegions < ActiveRecord::Migration[6.0]
  def change
    create_table :regions do |t|
      t.string :northside
      t.string :southside
      t.string :suburbs
      t.string :downtown
      t.string :westside

      t.timestamps
    end
  end
end
