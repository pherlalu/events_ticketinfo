class CreateJoinTableClassificationEvent < ActiveRecord::Migration[7.1]
  def change
    create_join_table :classifications, :events do |t|
      t.index [:classification_id, :event_id], unique: true
      # t.index [:event_id, :classification_id]
    end
  end
end
