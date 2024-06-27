class Classification < ApplicationRecord
  has_and_belongs_to_many :events

  def self.ransackable_associations(auth_object = nil)
    ["events"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["classification_id", "created_at", "genre", "id", "id_value", "segment", "updated_at"]
  end


  validates :classification_id, :segment, :genre, presence: true
end
