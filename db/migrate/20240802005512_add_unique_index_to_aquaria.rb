class AddUniqueIndexToAquaria < ActiveRecord::Migration[7.0]
  def change
    add_index :aquaria, :name, unique: true
  end
end
