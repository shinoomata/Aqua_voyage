class AddLatitudeAndLongitudeToAquaria < ActiveRecord::Migration[7.0]
  def change
    add_column :aquaria, :latitude, :float
    add_column :aquaria, :longitude, :float
  end
end
