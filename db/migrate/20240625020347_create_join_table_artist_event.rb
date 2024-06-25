class CreateJoinTableArtistEvent < ActiveRecord::Migration[7.1]
  def change
    create_join_table :artists, :events do |t|
      t.index [:artist_id, :event_id], unique: true
      # t.index [:event_id, :artist_id]
    end
  end
end
