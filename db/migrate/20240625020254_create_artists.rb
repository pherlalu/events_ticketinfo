class CreateArtists < ActiveRecord::Migration[7.1]
  def change
    create_table :artists do |t|
      t.string :artist_id
      t.string :name
      t.string :url
      t.string :image_url

      t.timestamps
    end
  end
end
