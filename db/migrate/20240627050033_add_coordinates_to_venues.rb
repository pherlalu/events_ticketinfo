class AddCoordinatesToVenues < ActiveRecord::Migration[7.1]
  def change
    add_column :venues, :longitude, :float
    add_column :venues, :latitude, :float
  end
end
