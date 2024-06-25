class CreateVenues < ActiveRecord::Migration[7.1]
  def change
    create_table :venues do |t|
      t.string :venue_id
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
