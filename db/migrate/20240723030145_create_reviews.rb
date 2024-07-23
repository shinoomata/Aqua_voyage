class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :aquaria_id
      t.text :content
      t.integer :target_audience_id
      t.integer :size_rating_id
      t.integer :highlight_id
      t.string :image_url

      t.timestamps
    end

    add_foreign_key :reviews, :users
    add_foreign_key :reviews, :aquaria, column: :aquaria_id
    add_foreign_key :reviews, :target_audiences
    add_foreign_key :reviews, :size_ratings
    add_foreign_key :reviews, :highlights
  end
end
