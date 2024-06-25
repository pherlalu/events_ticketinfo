class RemoveClassificationFromEvents < ActiveRecord::Migration[7.1]
  def change
    remove_reference :events, :classification, null: false, foreign_key: true
  end
end
