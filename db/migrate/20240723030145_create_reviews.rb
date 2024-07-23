class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :aquarium, null: false, foreign_key: { to_table: :aquaria }
      t.text :content
      t.references :target_audience, null: false, foreign_key: true
      t.references :size_rating, null: false, foreign_key: true
      t.references :highlight, null: false, foreign_key: true
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
