class Artist < ApplicationRecord
  has_and_belongs_to_many :events
  
  def self.ransackable_associations(auth_object = nil)
    ["events"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["artist_id", "created_at", "id", "id_value", "image_url", "name", "updated_at", "url"]
  end

  validates :artist_id, :name, :url, presence: true
  validates :artist_id, uniqueness: true
end
