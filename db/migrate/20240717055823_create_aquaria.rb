class CreateAquaria < ActiveRecord::Migration[7.0]
  def change
    create_table :aquaria do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.text :description

      t.timestamps
    end
  end
end
