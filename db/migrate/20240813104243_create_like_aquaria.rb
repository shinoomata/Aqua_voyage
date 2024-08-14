class CreateLikeAquaria < ActiveRecord::Migration[7.0]
  def change
    create_table :like_aquaria do |t|
      t.references :user, null: false, foreign_key: true
      t.references :aquarium, null: false, foreign_key: true

      t.timestamps
    end
    add_index :like_aquaria, [:user_id, :aquarium_id], unique: true
  end
end
