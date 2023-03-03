class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :review_content
      t.string :rating
      t.integer :user_id
      t.string :photo
      t.integer :spot_id

      t.timestamps
    end
  end
end
