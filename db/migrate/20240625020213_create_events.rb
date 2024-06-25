class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :event_id
      t.string :name
      t.string :url
      t.datetime :date_time
      t.references :venue, null: false, foreign_key: true
      t.references :classification, null: false, foreign_key: true
      t.string :image_url
      t.string :info
      t.float :min_price
      t.float :max_price

      t.timestamps
    end
  end
end
