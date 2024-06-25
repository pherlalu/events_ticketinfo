class CreateClassifications < ActiveRecord::Migration[7.1]
  def change
    create_table :classifications do |t|
      t.string :classification_id
      t.string :segment
      t.string :genre

      t.timestamps
    end
  end
end
