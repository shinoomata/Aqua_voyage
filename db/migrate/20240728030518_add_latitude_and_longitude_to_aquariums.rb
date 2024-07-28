class AddLatitudeAndLongitudeToAquariums < ActiveRecord::Migration[7.0]
  def change
    add_column :aquariums, :latitude, :float
    add_column :aquariums, :longitude, :float
  end
end
