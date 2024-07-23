class CreateSizeRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :size_ratings do |t|
      t.string :size

      t.timestamps
    end
  end
end
