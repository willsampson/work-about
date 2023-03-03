class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.boolean :cafe
      t.boolean :library
      t.boolean :hotel
      t.boolean :public_space
      t.boolean :mixed_use
      t.boolean :coworking
      t.boolean :outdoor_option

      t.timestamps
    end
  end
end
